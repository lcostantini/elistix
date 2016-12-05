defmodule Elistix.IndexTest do
  use ExUnit.Case
  import Elistix.Index

  setup do
    create_index("tests", "test")
    :ok

    on_exit fn ->
      remove_index("tests")
    end
  end

  describe "Elistix.Index.create_index/2" do
    test "create a new index" do
      remove_index("tests")
      case create_index("tests", "test") do
        {:ok, response} -> assert(response.status_code == 200)
      end

      # Create the same index return a 400
      case create_index("tests", "test") do
        {:ok, response} -> assert(response.status_code == 400)
      end
    end

    test "try to create an index without name or type" do
      assert create_index("tests") == "You need to specify a name and type"
      assert create_index() == "You need to specify a name and type"
    end
  end

  describe "Elistix.Index.remove_index/1" do
    test "remove the index" do
      case remove_index("tests") do
        {:ok, response} -> assert(response.status_code == 200)
      end

      case remove_index("nonexistent") do
        {:ok, response} -> assert(response.status_code == 404)
      end
    end

    test "try to remove an index without name" do
      assert remove_index() == "You need to specify a name"
    end
  end

  describe "Elistix.Index.index_stats/1" do
    test "show the stats for an index" do
      case index_stats("tests") do
        {:ok, response} -> assert(response.status_code == 200)
      end
    end

    test "show the stats of an unknown index" do
      case index_stats("unknown") do
        {:ok, response} -> assert(response.status_code == 404)
      end

      case index_stats("unknown") do
        {:ok, response} -> assert(response.body["error"]["reason"] == "no such index")
      end
    end

    test "try to remove an index without name" do
      assert remove_index() == "You need to specify a name"
    end
  end

  describe "Elistix.Index.load_data/3" do
    test "load data in an index" do
      data = '{ "id" : 1, "name" : "Order item for id 1", "status" : "good" }'
      case load_data("tests", "test", data) do
        {:ok, response} -> assert(response.status_code == 201)
      end
    end

    test "load bad formatted data in an index" do
      data = '{ id : 1, name : "Order item for id 1", "status" : "good" }'
      case load_data("tests", "test", data) do
        {:ok, response} -> assert(response.body["error"]["reason"] == "failed to parse")
      end
    end

    test "try to create an index without name or type" do
      assert load_data() == "You need to specify a name, type and data"
      assert load_data("tests") == "You need to specify a name, type and data"
      assert load_data("tests", "test") == "You need to specify a name, type and data"
    end
  end
end
