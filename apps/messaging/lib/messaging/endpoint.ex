defmodule Messaging.Endpoint do
  use Phoenix.Endpoint, otp_app: :messaging

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Messaging.Router
end
