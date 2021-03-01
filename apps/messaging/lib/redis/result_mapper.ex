defmodule Redis.StreamResultMapper do
  require Logger

  def entryListToMap(entryList) do
    IO.inspect(entryList)
    {_, map} = List.foldl(
      entryList,
      {false, %{}},
      fn (nextElem, {nextKey, map}) ->
        if nextKey == false do
          {nextElem, map}
        else
          {false, Map.put(map, nextKey, nextElem)}
        end
      end
    )
    IO.inspect(map)
    map
  end

  def mapToEntryList(map) do

  end

  def singleAdd(result) do
    case result do
      {:ok, id} ->
        {:ok, %{:id => id}}
    end
  end

  def singleRead(result) do
    case result do
      {:ok, [[id, entryList]]} ->
        {:ok, %{id: id, entries: entryListToMap(entryList)}}
    end
  end

end
