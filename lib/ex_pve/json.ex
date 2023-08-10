defmodule ExPVE.Operation.JSON do
  @moduledoc """
  Datastructure representing an operation on a JSON based AWS service.

  This module is generally not used directly, but rather is constructed by one
  of the relevant AWS services.

  These include:
  - DynamoDB
  - Kinesis
  - Lambda (Rest style)
  - ElasticTranscoder

  JSON services are generally pretty simple. You just need to populate the `data`
  attribute with whatever request body parameters need converted to JSON, and set
  any service specific headers.

  The `before_request`
  """

  defstruct stream_builder: nil,
            http_method: :post,
            parser: &Function.identity/1,
            error_parser: &Function.identity/1,
            path: "/",
            data: %{},
            params: %{},
            headers: [],
            service: nil,
            before_request: nil

  @type t :: %__MODULE__{}

  def new(service, opts) do
    struct(%__MODULE__{service: service}, opts)
  end
end

defimpl ExPVE.Operation, for: ExPVE.Operation.JSON do
  @type response_t :: %{} | ExPVE.Request.error_t()

  def perform(operation, config) do
    operation = handle_callbacks(operation, config)
    url = ExPVE.Request.Url.build(operation, config)

    headers = [
      {"x-amz-content-sha256", ""} | operation.headers
    ]

    ExPVE.Request.request(
      operation.http_method,
      url,
      operation.data,
      headers,
      config,
      operation.service
    )
    |> operation.error_parser.()
    |> ExPVE.Request.default_aws_error()
    |> parse(config)
  end

  defp handle_callbacks(%{before_request: nil} = op, _), do: op

  defp handle_callbacks(%{before_request: callback} = op, config) do
    callback.(op, config)
  end

  defp parse({:error, result}, _), do: {:error, result}
  defp parse({:ok, %{body: ""}}, _), do: {:ok, %{}}

  defp parse({:ok, %{body: body}}, config) do
    {:ok, config[:json_codec].decode!(body)}
  end
end
