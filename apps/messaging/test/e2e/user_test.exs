defmodule E2E.UserTest do
  use ExUnit.Case, async: false

  setup_all do
    Neuron.Config.set(url: "http://localhost:8080/api")
  end

  describe "user" do
    test "create & find" do
      assert %{"id" => id} = Messaging.UserClient.create()
      assert %{"id" => id} = Messaging.UserClient.find(id)
    end
  end
end