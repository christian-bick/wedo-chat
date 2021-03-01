defmodule Mongo.ResultMapper do
  require Logger

  def uuid (id) do
    BSON.ObjectId.encode!(id)
  end

  def singleDoc (result) do
    case result do
      %{"_id" => _id} = values ->
        decodedId = %{:id => uuid(_id)}
        decodedAttr = values
                      |> Map.delete("_id")
                      |> Map.keys()
                      |> List.foldl(
                           %{},
                           fn key, map ->
                             Map.put(map, String.to_existing_atom(key), values[key])
                           end
                         )
        {:ok, Map.merge(decodedId, decodedAttr)}
      nil ->
        {:error, ["Request Error", "Document not found"]}
    end
  end

  def singleInsert (result) do
    case result do
      {:error, error} ->
        Logger.error(error)
        {:error, ["Database Error", error.message]}
      {:ok, %Mongo.InsertOneResult{ :inserted_id => id }} ->
        {:ok, %{id: uuid(id)}}
    end
  end
end