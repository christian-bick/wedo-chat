defmodule Redis.StreamResultMapper do
  require Logger

  def singleAdd(result) do
    case result do
      {:error, error} ->
        Logger.error(error)
        {:error, ["Stream Error", error.message]}
      {:ok, id} ->
        {:ok, %{:id => id}}
      _ ->
        Logger.error("Unknown response")
        {:error, ["Stream Error", "Unknown response"]}
    end
  end

end
