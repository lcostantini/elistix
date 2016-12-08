defmodule Elistix.Index do
  @moduledoc """
  This module makes all the operations related to the index in ES.
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
  Attributes are two strings with the name of the index and the type.
  """
  def remove_index(name) do
    Elistix.delete("/#{name}")
  end

  @doc """
  Show index stats
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
  '{ "id" : 1, "name" : "Order item for id 1", "status" : "good" }'
  """
  def load_data(name, type, data) do
    Elistix.post("/#{name}/#{type}", data)
  end

  @doc """
  This endpoint refresh the index making all operations performed since the last
  refresh available for search.
  """
  def refresh(name) do
    Elistix.get("/#{name}/_refresh")
  end
end
