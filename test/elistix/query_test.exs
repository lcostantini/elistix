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

      # To get the data ready for search we need to refresh the index.
      refresh("tests")

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
