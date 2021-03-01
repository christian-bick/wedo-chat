defmodule E2E.ChannelTest do
  use ExUnit.Case, async: false

  setup_all do
    Neuron.Config.set(url: "http://localhost:8080/api")
  end

  describe "message" do

    setup do
      %{"id" => channel_id} = Messaging.ChannelClient.create()
      %{"id" => user_id} = Messaging.UserClient.create()
      {:ok, channel_id: channel_id, user_id: user_id}
    end

    test "post & find", %{:channel_id => channel_id, :user_id => user_id} do
      assert %{"id" => id} = Messaging.MessageClient.post(
               %{channel_id: channel_id, sender_id: user_id, content: "Content"}
             )
    end
  end
end