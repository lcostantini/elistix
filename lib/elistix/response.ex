defmodule Elistix.Response do
  @moduledoc """
  HTTPoison doesn't know when Elasticsearch fails so it returns a tuple with
  :ok and the response, so you can never know when something happens in
  Elasticsearch before explode in your code.
  This module catch the responses with status code 400 or 404 and build a new
  response with the :error in the tuple.
  """

  @doc """
  Here the response is captured and a new one is builded with the :error in
  the tuple if the status code is 400 or 404 or the response is returned
  without any change.
  """
  def parse_response(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 404}} -> {:error, elem(response, 1)}
      {:ok, %HTTPoison.Response{status_code: 400}} -> {:error, elem(response, 1)}
      _ -> response
    end
  end
end
