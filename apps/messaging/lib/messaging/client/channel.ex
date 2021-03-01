defmodule Messaging.ChannelClient do
  def create do
    Neuron.query(
      """
      mutation createChannel {
        createChannel {
          id
        }
      }
      """
    )
    |> Neuron.ResponseMapper.field(:createChannel)
  end

  def find(id) do
    Neuron.query(
      """
      {
        channel (id: "#{id}") {
          id
        }
      }
      """
    )
    |> Neuron.ResponseMapper.field(:channel)
  end
end