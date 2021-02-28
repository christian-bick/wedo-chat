defmodule Messaging.ChannelResolver do

  def find(_parent, %{:id => id}, _resolution) do
    Mongo.find_one(:mongo, "channels", %{_id: BSON.ObjectId.decode!(id)})
    |> Mongo.ResultMapper.singleDoc()
  end

  def create(_parent, _attr, _resolution) do
    Mongo.insert_one(:mongo, "channels", _attr)
    |> Mongo.ResultMapper.singleInsert()
  end

end
