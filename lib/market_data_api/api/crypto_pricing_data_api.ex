# NOTE: This file is auto generated by OpenAPI Generator 7.6.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule MarketDataAPI.Api.CryptoPricingDataAPI do
  @moduledoc """
  API calls for all endpoints tagged `CryptoPricingDataAPI`.
  """

  alias MarketDataAPI.Connection
  import MarketDataAPI.RequestBuilder

  @doc """
  Get Bar data for a crypto symbol
  The Bars API returns aggregate historical data for the requested securities.. Returns bars for the queried crypto symbol

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbol` (String.t): The crypto symbol to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD\" would be how you query for BTC.
  - `timeframe` (String.t): Timeframe for the aggregation. Values are customizeable, frequently used examples: 1Min, 15Min, 1Hour, 1Day. Limits: 1Min-59Min, 1Hour-23Hour.
  - `opts` (keyword): Optional parameters
    - `:start` (DateTime.t): Filter data equal to or after this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:end` (DateTime.t): Filter data equal to or before this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:exchanges` (String.t): A comma separated list of which crypto exchanges to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
    - `:limit` (integer()): Number of data points to return. Must be in range 1-10000, defaults to 1000.
    - `:page_token` (String.t): Pagination token to continue from. The value to pass here is returned in specific requests when more data is available than the request limit allows.

  ### Returns

  - `{:ok, MarketDataAPI.Model.BarsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_bars_for_crypto_symbol(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, MarketDataAPI.Model.BarsResponse.t} | {:error, Tesla.Env.t}
  def get_bars_for_crypto_symbol(connection, symbol, timeframe, opts \\ []) do
    optional_params = %{
      :start => :query,
      :end => :query,
      :exchanges => :query,
      :limit => :query,
      :page_token => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/#{symbol}/bars")
      |> add_param(:query, :timeframe, timeframe)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.BarsResponse}
    ])
  end

  @doc """
  Get Bars for multiple Crypto symbols
  returns aggregate historical data for the requested crypto symbols.  Returned results are sorted by symbol first then by Bar timestamp. This means that you are likely to see only one symbol in your first response if there are enough Bars for that symbol to hit the limit you requested on that request.  In these situations if you keep requesting again with the next_page_token you will eventually reach the next symbols if any Bars were found for them.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbols` (String.t): The comma-separated list of crypto symbols to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD,ETHUSD\" would get both BTC and ETH
  - `timeframe` (String.t): Timeframe for the aggregation. Values are customizeable, frequently used examples: 1Min, 15Min, 1Hour, 1Day. Limits: 1Min-59Min, 1Hour-23Hour.
  - `opts` (keyword): Optional parameters
    - `:start` (DateTime.t): Filter data equal to or after this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:end` (DateTime.t): Filter data equal to or before this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:page_token` (String.t): Pagination token to continue from. The value to pass here is returned in specific requests when more data is available than the request limit allows.
    - `:limit` (integer()): Number of data points to return. Must be in range 1-10000, defaults to 1000.
    - `:exchanges` (String.t): A comma separated list of which crypto exchanges to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`

  ### Returns

  - `{:ok, MarketDataAPI.Model.MultiBarsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_bars_for_multiple_crypto_symbols(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, MarketDataAPI.Model.MultiBarsResponse.t} | {:error, Tesla.Env.t}
  def get_bars_for_multiple_crypto_symbols(connection, symbols, timeframe, opts \\ []) do
    optional_params = %{
      :start => :query,
      :end => :query,
      :page_token => :query,
      :limit => :query,
      :exchanges => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/bars")
      |> add_param(:query, :symbols, symbols)
      |> add_param(:query, :timeframe, timeframe)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.MultiBarsResponse}
    ])
  end

  @doc """
  Get list of crypto spreads per exchange
  Get list of crypto spreads for the different exchanges Alpaca supports in basis points.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, MarketDataAPI.Model.CryptoSpreadsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_crypto_meta_spreads(Tesla.Env.client, keyword()) :: {:ok, MarketDataAPI.Model.CryptoSpreadsResponse.t} | {:error, Tesla.Env.t}
  def get_crypto_meta_spreads(connection, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/meta/spreads")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.CryptoSpreadsResponse}
    ])
  end

  @doc """
  Get Latest Bar data for a Crypto symbol
  Gets latest historical bar data for the requested crypto symbol for a specific exchange

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbol` (String.t): The crypto symbol to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD\" would be how you query for BTC.
  - `exchange` (String.t): Which crypto exchange to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, MarketDataAPI.Model.LatestBarResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_latest_bars_for_crypto_symbol(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, MarketDataAPI.Model.LatestBarResponse.t} | {:error, Tesla.Env.t}
  def get_latest_bars_for_crypto_symbol(connection, symbol, exchange, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/#{symbol}/bars/latest")
      |> add_param(:query, :exchange, exchange)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.LatestBarResponse}
    ])
  end

  @doc """
  Get Latest Bars for multiple Crypto symbols
  returns latest historical data for the requested crypto symbols for a specific exchange

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbols` (String.t): The comma-separated list of crypto symbols to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD,ETHUSD\" would get both BTC and ETH
  - `exchange` (String.t): Which crypto exchange to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, MarketDataAPI.Model.LatestMultiBarsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_latest_bars_for_multiple_crypto_symbols(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, MarketDataAPI.Model.LatestMultiBarsResponse.t} | {:error, Tesla.Env.t}
  def get_latest_bars_for_multiple_crypto_symbols(connection, symbols, exchange, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/bars/latest")
      |> add_param(:query, :symbols, symbols)
      |> add_param(:query, :exchange, exchange)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.LatestMultiBarsResponse}
    ])
  end

  @doc """
  Latest Quote
  Returns latest quote for the queried crypto symbol

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbol` (String.t): The crypto symbol to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD\" would be how you query for BTC.
  - `exchange` (String.t): Which crypto exchange to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, MarketDataAPI.Model.LatestQuoteResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_latest_quote_for_crypto_symbol(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, MarketDataAPI.Model.LatestQuoteResponse.t} | {:error, Tesla.Env.t}
  def get_latest_quote_for_crypto_symbol(connection, symbol, exchange, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/#{symbol}/quotes/latest")
      |> add_param(:query, :exchange, exchange)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.LatestQuoteResponse}
    ])
  end

  @doc """
  Get Latest Quotes for multiple Crypto symbols
  Provides latest quotes for a list of given crypto symbols.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbols` (String.t): The comma-separated list of crypto symbols to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD,ETHUSD\" would get both BTC and ETH
  - `exchange` (String.t): Which crypto exchange to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, MarketDataAPI.Model.LatestMultiQuotesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_latest_quotes_for_multiple_crypto_symbols(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, MarketDataAPI.Model.LatestMultiQuotesResponse.t} | {:error, Tesla.Env.t}
  def get_latest_quotes_for_multiple_crypto_symbols(connection, symbols, exchange, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/quotes/latest")
      |> add_param(:query, :symbols, symbols)
      |> add_param(:query, :exchange, exchange)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.LatestMultiQuotesResponse}
    ])
  end

  @doc """
  Latest Trades
  The Latest Trades API provides the latest historical trade data for a given crypto symbol. Returns trades for the queried crypto symbol.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbol` (String.t): The crypto symbol to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD\" would be how you query for BTC.
  - `exchange` (String.t): Which crypto exchange to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, MarketDataAPI.Model.LatestTradeResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_latest_trades_for_crypto_symbol(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, MarketDataAPI.Model.LatestTradeResponse.t} | {:error, Tesla.Env.t}
  def get_latest_trades_for_crypto_symbol(connection, symbol, exchange, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/#{symbol}/trades/latest")
      |> add_param(:query, :exchange, exchange)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.LatestTradeResponse}
    ])
  end

  @doc """
  Get Latest Trade data for multiple Crypto symbols
  Provides latest trade data for a list of given crypto symbols. 

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbols` (String.t): The comma-separated list of crypto symbols to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD,ETHUSD\" would get both BTC and ETH
  - `exchange` (String.t): Which crypto exchange to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, MarketDataAPI.Model.LatestMultiTradesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_latest_trades_for_multiple_crypto_symbols(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, MarketDataAPI.Model.LatestMultiTradesResponse.t} | {:error, Tesla.Env.t}
  def get_latest_trades_for_multiple_crypto_symbols(connection, symbols, exchange, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/trades/latest")
      |> add_param(:query, :symbols, symbols)
      |> add_param(:query, :exchange, exchange)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.LatestMultiTradesResponse}
    ])
  end

  @doc """
  Get Latest XBBO for a single crypto symbol
  Returns the XBBO for a crypto symbol that calculates the Best Bid and Offer across multiple exchanges. If exchanges is not specified then only the exchanges that can be traded on Alpaca are included in the calculation.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbol` (String.t): The crypto symbol to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD\" would be how you query for BTC.
  - `opts` (keyword): Optional parameters
    - `:exchanges` (String.t): A comma separated list of which crypto exchanges to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`

  ### Returns

  - `{:ok, MarketDataAPI.Model.LatestXbboResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_latest_xbbo_for_crypto_symbol(Tesla.Env.client, String.t, keyword()) :: {:ok, MarketDataAPI.Model.LatestXbboResponse.t} | {:error, Tesla.Env.t}
  def get_latest_xbbo_for_crypto_symbol(connection, symbol, opts \\ []) do
    optional_params = %{
      :exchanges => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/#{symbol}/xbbo/latest")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.LatestXbboResponse}
    ])
  end

  @doc """
  Get Latest XBBO for multiple crypto symbols
  Returns the latest XBBO for a given list crypto symbols that calculates the Best Bid and Offer across multiple exchanges. If exchanges is not specified then only the exchanges that can be traded on Alpaca are included in the calculation.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbols` (String.t): The comma-separated list of crypto symbols to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD,ETHUSD\" would get both BTC and ETH
  - `opts` (keyword): Optional parameters
    - `:exchanges` (String.t): A comma separated list of which crypto exchanges to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`

  ### Returns

  - `{:ok, MarketDataAPI.Model.LatestMultiXbboResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_latest_xbbo_for_multiple_crypto_symbols(Tesla.Env.client, String.t, keyword()) :: {:ok, MarketDataAPI.Model.LatestMultiXbboResponse.t} | {:error, Tesla.Env.t}
  def get_latest_xbbo_for_multiple_crypto_symbols(connection, symbols, opts \\ []) do
    optional_params = %{
      :exchanges => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/xbbos/latest")
      |> add_param(:query, :symbols, symbols)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.LatestMultiXbboResponse}
    ])
  end

  @doc """
  Get Quotes for crypto symbol
  The Quotes API provides quotes for a given crypto symbol at a specified date. Returns quotes for the queried crypto symbol

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbol` (String.t): The crypto symbol to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD\" would be how you query for BTC.
  - `opts` (keyword): Optional parameters
    - `:start` (DateTime.t): Filter data equal to or after this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:end` (DateTime.t): Filter data equal to or before this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:exchanges` (String.t): A comma separated list of which crypto exchanges to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
    - `:limit` (integer()): Number of data points to return. Must be in range 1-10000, defaults to 1000.
    - `:page_token` (String.t): Pagination token to continue from. The value to pass here is returned in specific requests when more data is available than the request limit allows.

  ### Returns

  - `{:ok, MarketDataAPI.Model.QuotesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_quotes_for_crypto_symbol(Tesla.Env.client, String.t, keyword()) :: {:ok, MarketDataAPI.Model.QuotesResponse.t} | {:error, Tesla.Env.t}
  def get_quotes_for_crypto_symbol(connection, symbol, opts \\ []) do
    optional_params = %{
      :start => :query,
      :end => :query,
      :exchanges => :query,
      :limit => :query,
      :page_token => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/#{symbol}/quotes")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.QuotesResponse}
    ])
  end

  @doc """
  Get Quotes for multiple crypto symbols
  The Multi Quotes API provides quotes for a list of given crypto symbols at a specified date. Returns quotes for each of  the queried crypto symbols.  Returned results are sorted by symbol first then by Quote timestamp. This means that you are likely to see only one symbol in your first response if there are enough Quotes for that symbol to hit the limit you requested on that request.  In these situations if you keep requesting again with the next_page_token you will eventually reach the next symbols if any Quotes were found for them.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbols` (String.t): The comma-separated list of crypto symbols to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD,ETHUSD\" would get both BTC and ETH
  - `opts` (keyword): Optional parameters
    - `:start` (DateTime.t): Filter data equal to or after this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:end` (DateTime.t): Filter data equal to or before this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:exchanges` (String.t): A comma separated list of which crypto exchanges to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
    - `:limit` (integer()): Number of data points to return. Must be in range 1-10000, defaults to 1000.
    - `:page_token` (String.t): Pagination token to continue from. The value to pass here is returned in specific requests when more data is available than the request limit allows.

  ### Returns

  - `{:ok, MarketDataAPI.Model.MultiQuotesReponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_quotes_for_multiple_crypto_symbols(Tesla.Env.client, String.t, keyword()) :: {:ok, MarketDataAPI.Model.MultiQuotesReponse.t} | {:error, Tesla.Env.t}
  def get_quotes_for_multiple_crypto_symbols(connection, symbols, opts \\ []) do
    optional_params = %{
      :start => :query,
      :end => :query,
      :exchanges => :query,
      :limit => :query,
      :page_token => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/quotes")
      |> add_param(:query, :symbols, symbols)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.MultiQuotesReponse}
    ])
  end

  @doc """
  Get a Snapshot for a crypto symbol
  The Snapshot API returns the latest trade, latest quote, minute bar daily bar, and previous daily bar data for a given crypto symbol.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbol` (String.t): The crypto symbol to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD\" would be how you query for BTC.
  - `exchange` (String.t): Which crypto exchange to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, MarketDataAPI.Model.Snapshot.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_snapshot_for_crypto_symbol(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, MarketDataAPI.Model.Snapshot.t} | {:error, Tesla.Env.t}
  def get_snapshot_for_crypto_symbol(connection, symbol, exchange, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/#{symbol}/snapshot")
      |> add_param(:query, :exchange, exchange)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.Snapshot}
    ])
  end

  @doc """
  Get Snapshots for multiple crypto symbols
  The Multi Snapshot API returns the latest trade, latest quote, minute bar daily bar, and previous daily bar data for list of given crypto symbols.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `exchange` (String.t): Which crypto exchange to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
  - `symbols` (String.t): The comma-separated list of crypto symbols to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD,ETHUSD\" would get both BTC and ETH
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, %{}}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_snapshots_for_multiple_crypto_symbols(Tesla.Env.client, String.t, String.t, keyword()) :: {:ok, map()} | {:error, Tesla.Env.t}
  def get_snapshots_for_multiple_crypto_symbols(connection, exchange, symbols, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/snapshots")
      |> add_param(:query, :exchange, exchange)
      |> add_param(:query, :symbols, symbols)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %{}}
    ])
  end

  @doc """
  Get Trade data for a crypto symbol
  The Trades API provides historical trade data for a given crypto symbol on a specified date. Returns trades for the queried crypto symbol

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbol` (String.t): The crypto symbol to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD\" would be how you query for BTC.
  - `opts` (keyword): Optional parameters
    - `:start` (DateTime.t): Filter data equal to or after this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:end` (DateTime.t): Filter data equal to or before this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:exchanges` (String.t): A comma separated list of which crypto exchanges to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
    - `:limit` (integer()): Number of data points to return. Must be in range 1-10000, defaults to 1000.
    - `:page_token` (String.t): Pagination token to continue from. The value to pass here is returned in specific requests when more data is available than the request limit allows.

  ### Returns

  - `{:ok, MarketDataAPI.Model.TradesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_trades_for_crypto_symbol(Tesla.Env.client, String.t, keyword()) :: {:ok, MarketDataAPI.Model.TradesResponse.t} | {:error, Tesla.Env.t}
  def get_trades_for_crypto_symbol(connection, symbol, opts \\ []) do
    optional_params = %{
      :start => :query,
      :end => :query,
      :exchanges => :query,
      :limit => :query,
      :page_token => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/#{symbol}/trades")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.TradesResponse}
    ])
  end

  @doc """
  Get Trade data for multiple crypto symbols
  The Multi Trades API provides historical trade data for a list of given crypto symbols on a specified date. Returns trades for the queried crypto symbols.  Returned results are sorted by symbol first then by Trade timestamp. This means that you are likely to see only one symbol in your first response if there are enough Trades for that symbol to hit the limit you requested on that request.  In these situations if you keep requesting again with the next_page_token you will eventually reach the next symbols if any Trades were found for them.

  ### Parameters

  - `connection` (MarketDataAPI.Connection): Connection to server
  - `symbols` (String.t): The comma-separated list of crypto symbols to query for. Note, currently all crypto symbols must be appended with \"USD\", ie \"BTCUSD,ETHUSD\" would get both BTC and ETH
  - `opts` (keyword): Optional parameters
    - `:start` (DateTime.t): Filter data equal to or after this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:end` (DateTime.t): Filter data equal to or before this time in RFC-3339 format. Fractions of a second are not accepted.
    - `:exchanges` (String.t): A comma separated list of which crypto exchanges to pull the data from. Alpaca currently supports `ERSX`, `CBSE`, and `FTXU`
    - `:limit` (integer()): Number of data points to return. Must be in range 1-10000, defaults to 1000.
    - `:page_token` (String.t): Pagination token to continue from. The value to pass here is returned in specific requests when more data is available than the request limit allows.

  ### Returns

  - `{:ok, MarketDataAPI.Model.MultiTradesResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_trades_for_multiple_crypto_symbols(Tesla.Env.client, String.t, keyword()) :: {:ok, MarketDataAPI.Model.MultiTradesResponse.t} | {:error, Tesla.Env.t}
  def get_trades_for_multiple_crypto_symbols(connection, symbols, opts \\ []) do
    optional_params = %{
      :start => :query,
      :end => :query,
      :exchanges => :query,
      :limit => :query,
      :page_token => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/v1beta1/crypto/trades")
      |> add_param(:query, :symbols, symbols)
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, MarketDataAPI.Model.MultiTradesResponse}
    ])
  end
end