defmodule Neuron.ResponseMapper do
  def field(response, field) do
    case response do
      {
        :ok,
        %Neuron.Response{
          body: %{
            "data" => data
          },
          status_code: 200
        }
      } -> data[to_string(field)]
    end
  end
end