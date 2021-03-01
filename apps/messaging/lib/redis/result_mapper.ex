defmodule Redis.StreamResultMapper do
  require Logger

  def singleAdd(result) do
    case result do
      {:ok, id} ->
        {:ok, %{:id => id}}
      {:error, error} ->
        Logger.error(error)
        {:error, ["Stream Error", error.message]}
      _ ->
        Logger.error("Unknown response")
        {:error, ["Stream Error", "Unknown response"]}
    end
  end

end
