defmodule Mongo.Mapper do
  require Logger

  def decode (result) do
    case result do
      {:error, error} ->
        Logger.error(error)
        {:error, ["Database Error", error.message]}
      nil ->
        {:error, "Not found"}
      %{"_id" => _id} = values ->
        decodedId = %{:id => BSON.ObjectId.encode!(_id)}
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
    end
  end
end