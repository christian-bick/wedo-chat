defmodule Messaging.Resolvers.Links do

  def all_links(_parent, _args, _resolution) do
    {:ok, [%{ id: 1, url: "https://www.google.de" }]}
  end

end
