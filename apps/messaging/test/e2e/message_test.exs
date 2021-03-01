defmodule E2E.ChannelTest do
  use ExUnit.Case, async: false

  setup_all do
    Neuron.Config.set(url: "http://localhost:8080/api")
  end

  describe "message" do

    setup do
      {
        :ok,
        %Neuron.Response{
          body: %{
            "data" => %{
              "createChannel" => %{
                "id" => channel_id
              }
            }
          }
        }
      } = Neuron.query(
        """
        mutation createChannel {
          createChannel {
            id
          }
        }
        """
      )

      {
        :ok,
        %Neuron.Response{
          body: %{
            "data" => %{
              "createUser" => %{
                "id" => user_id
              }
            }
          }
        }
      } = Neuron.query(
        """
        mutation createUser {
          createUser {
            id
          }
        }
        """
      )

      {:ok, channel_id: channel_id, user_id: user_id}
    end

    test "post & find", %{ :channel_id => channel_id, :user_id => user_id} do
      query = """
      mutation postMessage {
        postMessage(channel_id: "#{channel_id}", sender_id: "#{user_id}", content: "Test") {
          id
        }
      }
      """
      IO.puts(query)
      postResult = Neuron.query(query)

      assert {
               :ok,
               %Neuron.Response{
                 body: %{
                   "data" => %{
                     "postMessage" => %{
                       "id" => id
                     }
                   }
                 }
               }
             } = postResult
    end
  end
end