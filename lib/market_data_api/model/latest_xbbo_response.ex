# NOTE: This file is auto generated by OpenAPI Generator 7.6.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MarketDataAPI.Model.LatestXbboResponse do
  @moduledoc """
  Represents the Latest XBBO for a crypto symbol that calculates the Best Bid and Offer across multiple exchanges.
  """

  @derive Jason.Encoder
  defstruct [
    :symbol,
    :xbbo
  ]

  @type t :: %__MODULE__{
    :symbol => String.t,
    :xbbo => MarketDataAPI.Model.Xbbo.t
  }

  alias MarketDataAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:xbbo, :struct, MarketDataAPI.Model.Xbbo)
  end
end

