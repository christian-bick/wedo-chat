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

  def find(args) do
    Neuron.query(
      """
      {
        message (channel_id: "#{args.channel_id}", message_id: "#{args.message_id}") {
          id
        }
      }
      """
    )
    |> Neuron.ResponseMapper.field(:message)
  end
end