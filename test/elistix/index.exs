defmodule Elistix.IndexTest do
  use ExUnit.Case
  import Elistix.Index

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
    assert create_index("tests") == "You need to specify a name and input"
    assert create_index() == "You need to specify a name and input"
  end

  test "remove a index" do
    create_index("tests")
    case remove_index("tests") do
      {:ok, response} -> assert(response.status_code == 200)
    end

    # Remove the same index return a 400
    case remove_index("tests") do
      {:ok, response} -> assert(response.status_code == 404)
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

  test "show the stats for an existing index" do
    create_index("tests", "test")
    case index_stats("tests") do
      {:ok, response} -> assert(response.status_code == 200)
    end
  end
end
