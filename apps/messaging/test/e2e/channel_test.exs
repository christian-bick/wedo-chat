defmodule E2E.ChannelTest do
  use ExUnit.Case, async: false

  setup_all do
    Neuron.Config.set(url: "http://localhost:8080/api")
  end

  describe "channel" do

    test "create & find" do

      createResult = Neuron.query(
        """
        mutation createChannel {
          createChannel(name: "World") {
            id
          }
        }
        """
      )

      assert {
               :ok,
               %Neuron.Response{
                 body: %{
                   "data" => %{
                     "createChannel" => %{
                       "id" => id
                     }
                   }
                 },
                 status_code: 200
               }
             } = createResult

      findResult = Neuron.query(
        """
        {
         channel(id: "#{id}") {
           id
           name
         }
        }
        """
      )

      assert {
               :ok,
               %Neuron.Response{
                 body: %{
                   "data" => %{
                     "channel" => %{
                       "id" => id,
                       "name" => "World"
                     }
                   }
                 },
                 status_code: 200
               }
             } = findResult
    end
  end
end