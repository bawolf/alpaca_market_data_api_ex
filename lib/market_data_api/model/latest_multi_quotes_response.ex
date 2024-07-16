# NOTE: This file is auto generated by OpenAPI Generator 7.6.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MarketDataAPI.Model.LatestMultiQuotesResponse do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :quotes
  ]

  @type t :: %__MODULE__{
    :quotes => %{optional(String.t) => MarketDataAPI.Model.Quote.t}
  }

  alias MarketDataAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:quotes, :map, MarketDataAPI.Model.Quote)
  end
end

