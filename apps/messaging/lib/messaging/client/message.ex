defmodule Messaging.MessageClient do
  def post(args) do
    Neuron.query(
      """
      mutation postMessage {
        postMessage(channel_id: "#{args.channel_id}", sender_id: "#{args.sender_id}", content: "#{args.content}") {
          id
        }
      }
      """
    )
    |> Neuron.ResponseMapper.field(:postMessage)
  end

  def find(id) do
    Neuron.query(
      """
      {
        message (id: "#{id}") {
          id
        }
      }
      """
    )
    |> Neuron.ResponseMapper.field(:message)
  end
end