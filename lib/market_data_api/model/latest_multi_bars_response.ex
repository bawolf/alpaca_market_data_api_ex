# NOTE: This file is auto generated by OpenAPI Generator 7.6.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MarketDataAPI.Model.LatestMultiBarsResponse do
  @moduledoc """
  A model representing the result of hitting the Latest Multi Bars api; represents the latest Bars for multiple symbols. 
  """

  @derive Jason.Encoder
  defstruct [
    :bars
  ]

  @type t :: %__MODULE__{
    :bars => %{optional(String.t) => MarketDataAPI.Model.Bar.t}
  }

  alias MarketDataAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:bars, :map, MarketDataAPI.Model.Bar)
  end
end

