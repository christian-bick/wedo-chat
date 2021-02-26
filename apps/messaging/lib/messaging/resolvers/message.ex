defmodule Messaging.MessageResolver do

  def recent(_parent, _args, _resolution) do
    {:ok, [%{ channel: "1", content: "Hello" }]}
  end

end
