defmodule Messaging.MessageResolver do

  def post(_parent, %{:channel_id => channel_id, :sender_id => sender_id, :content => content}, _resolution) do
    Redix.command(:redis, ["XADD", "channel-#{channel_id}", "*", "sender_id", sender_id, "content", content])
    |> Redis.StreamResultMapper.singleAdd
  end

  def find(_parent, %{:id => id}, _resolution) do
    IO.inspect(id);
  end

  def recent(_parent, _args, _resolution) do
    {:ok, [%{channel: "1", content: "Hello"}]}
  end

end
