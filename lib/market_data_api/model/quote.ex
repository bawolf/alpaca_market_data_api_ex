# NOTE: This file is auto generated by OpenAPI Generator 7.6.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MarketDataAPI.Model.Quote do
  @moduledoc """
  The Quotes API provides NBBO quotes for a given ticker symbol at a specified date. 
  """

  @derive Jason.Encoder
  defstruct [
    :t,
    :ax,
    :ap,
    :as,
    :bx,
    :bp,
    :bs,
    :c,
    :x,
    :z
  ]

  @type t :: %__MODULE__{
    :t => DateTime.t,
    :ax => String.t | nil,
    :ap => float() | nil,
    :as => float() | nil,
    :bx => String.t | nil,
    :bp => float() | nil,
    :bs => float() | nil,
    :c => [String.t] | nil,
    :x => String.t | nil,
    :z => String.t | nil
  }

  alias MarketDataAPI.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:t, :datetime, nil)
  end
end
