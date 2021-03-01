defmodule E2E.MessageTest do
  use ExUnit.Case, async: false

  setup_all do
    Neuron.Config.set(url: "http://localhost:8080/api")
  end

  describe "channel" do

    test "create & find" do

      createResult = Neuron.query(
        """
        mutation createChannel {
          createChannel {
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
                     }
                   }
                 },
                 status_code: 200
               }
             } = findResult
    end
  end
end