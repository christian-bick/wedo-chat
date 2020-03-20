import Plug.Conn

defmodule Messaging.Router do
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipe_through :api

  forward "/doc", Absinthe.Plug.GraphiQL,
    schema: MessagingWeb.Schema

  forward "/api", Absinthe.Plug,
    schema: MessagingWeb.Schema
end
