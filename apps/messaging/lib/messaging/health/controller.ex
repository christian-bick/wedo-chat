defmodule Messaging.HealthController do
  use Phoenix.Controller
  require Logger

  def index(conn, params) do
    value = :rand.uniform(10000)
    {:ok, _} = Redix.command(:redis, ["SET", "health-check", value])
    {:ok, value} = Redix.command(:redis, ["GET", "health-check"])
    {:ok, result} = Mongo.insert_one(:mongo, "health-check", %{ value: value })
    %{"_id" => _, "value" => value} = Mongo.find_one(:mongo, "health-check", %{ _id: result.inserted_id })
    text(conn, "OK")
  end
end