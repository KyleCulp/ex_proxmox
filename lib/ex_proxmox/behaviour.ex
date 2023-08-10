defmodule ExProxmox.Behaviour do
  @moduledoc """
  A behaviour definition for the core operations of ExProxmox.

  `ExProxmox` implements this behaviour.
  """

  @doc "See `ExProxmox.request/2`."
  @callback request(ExProxmox.Operation.t()) :: {:ok, term} | {:error, term}

  @doc "See `ExProxmox.request/2`."
  @callback request(ExProxmox.Operation.t(), Keyword.t()) :: {:ok, term} | {:error, term}

  @doc "See `ExProxmox.request!/2`."
  @callback request!(ExProxmox.Operation.t()) :: term | no_return

  @doc "See `ExProxmox.request!/2`."
  @callback request!(ExProxmox.Operation.t(), Keyword.t()) :: term | no_return
end
