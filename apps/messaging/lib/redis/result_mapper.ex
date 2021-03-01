defmodule Redis.StreamResultMapper do
  require Logger

  def entryListToMap(entryList) do
    {_, map} = List.foldl(
      entryList,
      {false, %{}},
      fn (nextElem, {nextKey, map}) ->
        if nextKey == false do
          {nextElem, map}
        else
          {false, Map.put(map, String.to_existing_atom(nextKey), nextElem)}
        end
      end
    )
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

  def singleFetch(result) do
    case result do
      {:ok, [[id, entryList]]} ->
        {:ok, %{id: id, entries: entryListToMap(entryList)}}
    end
  end

  def multiFetch(result) do
    case result do
      {:ok, list } ->
        {:ok, Enum.map(list, fn [id, entryList] -> %{id: id, entries: entryListToMap(entryList)} end) }
    end
  end

end
