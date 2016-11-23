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
  def create_index, do: "You need to specify a name and input"
  def create_index(_), do: "You need to specify a name and input"

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
end
