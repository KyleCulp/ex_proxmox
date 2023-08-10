defmodule ExPVE do
  @moduledoc """
  Documentation for ExPVE. Wrapper for Proxmox API.
  """

  use Application

  @behaviour ExPVE.Behaviour

  @doc """
  Perform an AWS request.

  First build an operation from one of the services, and then pass it to this
  function to perform it.

  If you want to build an operation manually, see: `ExPVE.Operation`

  This function takes an optional second parameter of configuration overrides.
  This is useful if you want to have certain configuration changed on a per
  request basis.

  Also you can configure telemetry metrics with:

    * `:telemetry_event` - The telemetry event name to dispatch the event under.
      Defaults to `[:ex_aws, :request]`.
    * `:telemetry_options` - Extra options to attach to telemetry event name.

  ## Examples

  If you have one of the service modules installed, you can just use those service
  modules like this:

      ExPVE.S3.list_buckets |> ExPVE.request

      ExPVE.S3.list_buckets |> ExPVE.request(region: "eu-west-1")

      ExPVE.Dynamo.get_object("users", "foo@bar.com") |> ExPVE.request

  Alternatively you can create operation structs manually for services
  that aren't supported:

      op = %ExPVE.Operation.JSON{
        http_method: :post,
        service: :dynamodb,
        headers: [
          {"x-amz-target", "DynamoDB_20120810.ListTables"},
          {"content-type", "application/x-amz-json-1.0"}
        ],
      }

      ExPVE.request(op)

  ## Telemetry events

  The following events are published:

  * `[:ex_aws, :request, :start]` - dispatched on start every request sent to the AWS.
  * `[:ex_aws, :request, :stop]` - dispatched on every response from AWS.
  * `[:ex_aws, :request, :exception]` - dispatched after exceptions on request sent to AWS.

  With `:metadata` map including the following fields:

    * `:result` - the request result: `:ok` or `:error`
    * `:attempt` - the attempt number
    * `:service` - the AWS service
    * `:options` - extra options given to the repo operation under
      `:telemetry_options`

  """
  @impl ExPVE.Behaviour
  @spec request(ExPVE.Operation.t(), keyword) :: {:ok, term} | {:error, term}
  def request(op, config_overrides \\ []) do
    ExPVE.Operation.perform(op, ExPVE.Config.new(op.service, config_overrides))
  end

  @doc """
  Perform an AWS request, raise if it fails.

  Same as `request/1,2` except it will either return the successful response from
  AWS or raise an exception.
  """
  @impl ExPVE.Behaviour
  @spec request!(ExPVE.Operation.t(), keyword) :: term
  def request!(op, config_overrides \\ []) do
    case request(op, config_overrides) do
      {:ok, result} ->
        result

      error ->
        raise ExPVE.Error, """
        ExPVE Request Error!

        #{inspect(error)}
        """
    end
  end

  @doc """
  Hello world.

  ## Examples

      iex> ExPVE.hello()
      :world

  """
  def hello do
    :world
  end

  @doc false
  @impl Application
  def start(_type, _args) do
    children = [
      {ExPVE.Config.AuthCache, [name: ExPVE.Config.AuthCache]},
      {ExPVE.InstanceMetaTokenProvider, [name: ExPVE.InstanceMetaTokenProvider]}
    ]

    opts = [strategy: :one_for_one, name: ExPVE.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
