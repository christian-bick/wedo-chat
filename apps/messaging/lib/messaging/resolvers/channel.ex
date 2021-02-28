defmodule Messaging.ChannelResolver do

  def find(_parent, %{:id => id}, _resolution) do
    result = Mongo.find_one(:mongo, "channels", %{_id: BSON.ObjectId.decode!(id)}) |> Mongo.Mapper.decode
    IO.inspect result
    result
  end

  def create(_parent, %{:name => name}, _resolution) do
    {:ok, result} = Mongo.insert_one(:mongo, "channels", %{name: name})
    {:ok, %{id: BSON.ObjectId.encode!(result.inserted_id), name: name}}
  end

end
