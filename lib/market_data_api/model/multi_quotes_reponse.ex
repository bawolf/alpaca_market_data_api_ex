# NOTE: This file is auto generated by OpenAPI Generator 7.6.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MarketDataAPI.Model.MultiQuotesReponse do
  @moduledoc """
  A model representing the result of hitting the Multi Quotes api; represents multiple Quotes for multiple symbols.  Returned results are sorted by symbol first then by Quote timestamp. This means that you are likely to see only one symbol in your first response if there are enough Quotes for that symbol to hit the limit you requested on that request.  In these situations if you keep requesting again with the next_page_token you will eventually reach the next symbols if any Quotes were found for them. 
  """

  @derive Jason.Encoder
  defstruct [
    :quotes,
    :next_page_token
  ]

  @type t :: %__MODULE__{
    :quotes => %{optional(String.t) => [MarketDataAPI.Model.Quote.t]},
    :next_page_token => String.t | nil
  }

  def decode(value) do
    value
  end
end
