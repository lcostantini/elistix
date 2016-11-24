defmodule Elistix.QueryTest do
  use ExUnit.Case
  import Elistix.Query

  test "try a query" do
    case search("orders", "order", '{ "query" : { "match_all" : {} }}') do
      {:ok, response} -> assert(response.status_code == 200)
    end
  end
end
