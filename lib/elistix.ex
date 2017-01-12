defmodule Elistix do
  alias Elistix.Response

  @moduledoc """
  Provides a configuration base for the other modules.

  Here you can find methods used by HTTPoison to configure the URL, headers
  and body (you can read the doc to get more info - https://github.com/edgurgel/httpoison/blob/master/lib/httpoison/base.ex).

  If you want to change any of this behavior you need to override the functions
  in your code.
  """

  use HTTPoison.Base

  @endpoint System.get_env("ES_URI") || Application.get_env(:elistix, :es_uri) || "http://127.0.0.1:9200"

  def get(url), do: Response.parse_response(super(url))
  def post(url, data), do: Response.parse_response(super(url, data))
  def put(url, data), do: Response.parse_response(super(url, data))
  def delete(url), do: Response.parse_response(super(url))

  defp process_url(url) do
    @endpoint <> url
  end

  defp process_response_body(body) do
    body |> Poison.decode!
  end

  defp process_request_headers(headers) do
    [{"content-type", "application/json"} | headers]
  end
end
