defmodule E2E.ChannelTest do
  use ExUnit.Case, async: false

  describe "channel" do
    test "create" do
      Neuron.Config.set(url: "http://localhost:8080/api")
      result = Neuron.query(
        """
        mutation createChannel {
          createChannel(name: "World") {
            id
          }
        }
        """
      )
      assert {:ok,
        %Neuron.Response{
          body: %{
            "data" => %{"createChannel" => %{"id" => _ }}
          },
          status_code: 200
        }
      } = result
    end
  end
end