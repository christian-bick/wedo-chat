defmodule Messaging.ChannelResolver do

  def find(_parent, _args, _resolution) do
    {:ok, %{ id: "1", name: "Channel Name" }}
  end

  def create(_parent, _args, _resolution) do
    {:ok, result} = Mongo.insert_one(:mongo, "channels", _args)
    {:ok, %{ id: BSON.ObjectId.encode! result.inserted_id }}
  end

end
