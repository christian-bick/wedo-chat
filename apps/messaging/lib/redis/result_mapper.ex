defmodule Redis.StreamResultMapper do
  require Logger

  def singleAdd(result) do
    case result do
      {:ok, id} ->
        {:ok, %{:id => id}}
    end
  end

end
