# NOTE: This file is auto generated by OpenAPI Generator 7.6.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MarketDataAPI.Model.CryptoSpreadsResponse do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :spreads
  ]

  @type t :: %__MODULE__{
    :spreads => %{optional(String.t) => integer()}
  }

  def decode(value) do
    value
  end
end
