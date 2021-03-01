defmodule E2E.MessageTest do
  use ExUnit.Case, async: false

  setup_all do
    Neuron.Config.set(url: "http://localhost:8080/api")
  end

  describe "message" do

    setup do
      %{"id" => channel_id} = Messaging.ChannelClient.create()
      %{"id" => user_id} = Messaging.UserClient.create()
      {:ok, channel_id: channel_id, sender_id: user_id}
    end

    test "post & find", context do
      post_result = Messaging.MessageClient.post(
        Map.merge(context, %{content: "test-content"})
      )
      assert %{"id" => message_id} = post_result

      find_result = Messaging.MessageClient.find(
        %{channel_id: context.channel_id, message_id: message_id}
      )
      assert %{"id" => message_id} = find_result
    end

    test "find with messages", context do
      Messaging.MessageClient.post(Map.merge(context, %{content: "test-1"}))
      Messaging.MessageClient.post(Map.merge(context, %{content: "test-2"}))
      Messaging.MessageClient.post(Map.merge(context, %{content: "test-3"}))

      result = Messaging.ChannelClient.findWithMessages(context.channel_id)
      assert %{
        "id" => _,
        "messages" => [
          %{"content" => "test-1", "id" => _},
          %{"content" => "test-2", "id" => _},
          %{"content" => "test-3", "id" => _}
        ]
      } = result

    end
  end
end