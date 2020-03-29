import Config

config :messaging, Messaging.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mnQh/VRis+EAAo8j3VmeOGIbE+kIPp5CP4uT54fTsmjupOxI04eYld+Xrd0pJh7G",
  render_errors: [view: MessagingWeb.ErrorView, accepts: ~w(json)],
  live_view: [signing_salt: "Yq/Meaft"]

import_config "#{Mix.env()}.exs"
