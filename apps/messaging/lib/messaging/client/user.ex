defmodule Messaging.UserClient do
  def create do
    Neuron.query(
      """
      mutation createUser {
        createUser {
          id
        }
      }
      """
    )
    |> Neuron.ResponseMapper.field(:createUser)
  end

  def find(id) do
    Neuron.query(
      """
      {
        user (id: "#{id}") {
          id
        }
      }
      """
    )
    |> Neuron.ResponseMapper.field(:user)
  end
end