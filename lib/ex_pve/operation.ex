defprotocol ExPVE.Operation do
  @moduledoc """
  An operation to perform on AWS.

  This module defines a protocol for executing operations on AWS. ExPVE ships with
  several different modules that each implement the `ExPVE.Operation` protocol. These
  modules each handle one of the broad categories of AWS service types:

  - `ExPVE.Operation.JSON`
  - `ExPVE.Operation.Query`
  - `ExPVE.Operation.RestQuery`
  - `ExPVE.Operation.S3`

  ExPVE works by creating a data structure that implements this protocol, and then
  calling `perform/2` on it.
  """

  @doc """
  Perform a request on AWS.

  The operation is synchronous, returning a response or an error.

  ## Example

      %ExPVE.Operation.JSON{
        data: %{},
        headers: [
          {"x-amz-target", "DynamoDB_20120810.ListTables"},
          {"content-type", "application/x-amz-json-1.0"}
        ],
        http_method: :post,
        params: %{},
        path: "/",
        service: :dynamodb,
      } |> ExPVE.Operation.perform(ExPVE.Config.new(:dynamodb))

  """
  def perform(operation, config)

  @doc """
  Perform a *streaming* request on AWS.
  """
  def stream!(operation, config)
end
