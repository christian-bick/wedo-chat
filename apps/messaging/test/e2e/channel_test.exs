defmodule E2E.ChannelTest do
  use ExUnit.Case, async: false

  setup_all do
    Neuron.Config.set(url: "http://localhost:8080/api")
  end

  describe "channel" do
    test "create & find" do
      assert %{"id" => id} = Messaging.ChannelClient.create()
      assert %{"id" => id} = Messaging.ChannelClient.find(id)
    end
  end
end