defmodule ExPVE.Behaviour do
  @moduledoc """
  A behaviour definition for the core operations of ExPVE.

  `ExPVE` implements this behaviour.
  """

  @doc "See `ExPVE.request/2`."
  @callback request(ExPVE.Operation.t()) :: {:ok, term} | {:error, term}

  @doc "See `ExPVE.request/2`."
  @callback request(ExPVE.Operation.t(), Keyword.t()) :: {:ok, term} | {:error, term}

  @doc "See `ExPVE.request!/2`."
  @callback request!(ExPVE.Operation.t()) :: term | no_return

  @doc "See `ExPVE.request!/2`."
  @callback request!(ExPVE.Operation.t(), Keyword.t()) :: term | no_return
end
