defmodule Elistix.QueryTest do
  use ExUnit.Case
  import Elistix.Index
  import Elistix.Query

  setup do
    on_exit fn ->
      remove_index("tests")
    end
  end

  describe "Elistix.Query.search/3" do
    test "try to get all the elements in an index" do
      data = '{ "id" : 1, "name" : "Order item for id 1", "status" : "good" }'
      load_data("tests", "test", data)

      # If the process is faster than the load in the index this test fails,
      # this is why I added the sleep.
      Process.sleep(1000)

      query = '{ "query" : { "match_all" : {} }}'
      case search("tests", "test", query) do
        {:ok, response} ->
          name = List.first(response.body["hits"]["hits"])
                |> Map.get("_source")
                |> Map.get("name")
          assert(name == "Order item for id 1")
      end
    end
  end
end
