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
  def create_index, do: "You need to specify a name and type"
  def create_index(_), do: "You need to specify a name and type"

  @doc """
  Delete an index.
  Attributes are two strings with the name of the index and the type.
  """
  def remove_index(name) do
    Elistix.delete("/#{name}")
  end
  def remove_index, do: "You need to specify a name"

  @doc """
  Show index stats
  """
  def index_stats(name) do
    Elistix.get("/#{name}/_stats")
  end
  def index_stats, do: "You need to specify a name"

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
  def load_data, do: "You need to specify a name, type and data"
  def load_data(_), do: "You need to specify a name, type and data"
  def load_data(_, _), do: "You need to specify a name, type and data"
end
