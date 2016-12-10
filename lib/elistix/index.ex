defmodule Elistix.Index do
  @moduledoc """
  This module makes all the operations related to the indices in Elasticsearch.
  """

  @doc """
  Create a new index.

  Attributes are two strings with the name of the index and the type.
  """
  def create_index(name, type) do
    Elistix.put("/#{name}", '{"mappings" : {"#{type}" : {}}}')
  end

  @doc """
  Delete an index.

  You need to specify the name of the index to remove.
  """
  def remove_index(name) do
    Elistix.delete("/#{name}")
  end

  @doc """
  Show index stats

  You need to specify the name of the index you want to get the stats.

  See https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-stats.html
  to get more details about this.
  """
  def index_stats(name) do
    Elistix.get("/#{name}/_stats")
  end

  @doc """
  Populate with data any index.

  Attributes are two strings with the name of the index and the type, the
  third attribute is a JSON that contains the data you want to save.

  The data attribute is a JSON with key and value with the information
  you want to save.

  ## Examples

    data = '{ "id" : 1, "name" : "Order item for id 1", "status" : "good" }'

    load_data("tests", "test", data)
  """
  def load_data(name, type, data) do
    Elistix.post("/#{name}/#{type}", data)
  end

  @doc """
  Refresh the index to get ready for search.

  Specify the name of the index you want to refresh.
  You can refresh the index making all operations performed available for search.
  """
  def refresh(name) do
    Elistix.get("/#{name}/_refresh")
  end
end
