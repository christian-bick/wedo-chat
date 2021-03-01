defmodule E2E.ChannelTest do
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
      assert %{"id" => id} = Messaging.MessageClient.post(
               Map.merge(context, %{content: "test-content"})
             )
    end
  end
end