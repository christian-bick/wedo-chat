defmodule Messaging.MessageResolver do

  def post(_parent, %{:channel_id => channel_id, :sender_id => sender_id, :content => content}, _resolution) do
    Redix.command(:redis, ["XADD", "channel:#{channel_id}", "*", "sender_id", sender_id, "content", content])
    |> Redis.StreamResultMapper.singleAdd
  end

  def find(_parent, %{:channel_id => channel_id, :message_id => message_id}, _resolution) do
    {:ok, %{:id => id, :entries => entries}} =
      Redix.command(:redis, ["XRANGE", "channel:#{channel_id}", message_id, "+", "COUNT", "1"])
      |> Redis.StreamResultMapper.singleRead
    {:ok, Map.merge(%{id: id}, entries)}
  end

  def recent(_parent, _args, _resolution) do
    {:ok, [%{channel: "1", content: "Hello"}]}
  end

end
