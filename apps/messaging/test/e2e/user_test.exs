defmodule E2E.UserTest do
  use ExUnit.Case, async: false

  setup_all do
    Neuron.Config.set(url: "http://localhost:8080/api")
  end

  describe "user" do

    test "create & find" do

      createResult = Neuron.query(
        """
        mutation createUser {
          createUser {
            id
          }
        }
        """
      )

      assert { :ok,
               %Neuron.Response{
                 body: %{
                   "data" => %{
                     "createUser" => %{
                       "id" => id
                     }
                   }
                 }
               }
             } = createResult

      findResult = Neuron.query(
        """
        {
          user(id: "#{id}") {
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
                     "user" => %{
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