defprotocol ExProxmox.Operation do
  @moduledoc """
  An operation to perform on AWS.

  This module defines a protocol for executing operations on AWS. ExProxmox ships with
  several different modules that each implement the `ExProxmox.Operation` protocol. These
  modules each handle one of the broad categories of AWS service types:

  - `ExProxmox.Operation.JSON`
  - `ExProxmox.Operation.Query`
  - `ExProxmox.Operation.RestQuery`
  - `ExProxmox.Operation.S3`

  ExProxmox works by creating a data structure that implements this protocol, and then
  calling `perform/2` on it.
  """

  @doc """
  Perform a request on AWS.

  The operation is synchronous, returning a response or an error.

  ## Example

      %ExProxmox.Operation.JSON{
        data: %{},
        headers: [
          {"x-amz-target", "DynamoDB_20120810.ListTables"},
          {"content-type", "application/x-amz-json-1.0"}
        ],
        http_method: :post,
        params: %{},
        path: "/",
        service: :dynamodb,
      } |> ExProxmox.Operation.perform(ExProxmox.Config.new(:dynamodb))

  """
  def perform(operation, config)

  @doc """
  Perform a *streaming* request on AWS.
  """
  def stream!(operation, config)
end
