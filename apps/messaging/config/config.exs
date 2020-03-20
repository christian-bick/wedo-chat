# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :messaging, Messaging.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mnQh/VRis+EAAo8j3VmeOGIbE+kIPp5CP4uT54fTsmjupOxI04eYld+Xrd0pJh7G",
  render_errors: [view: MessagingWeb.ErrorView, accepts: ~w(json)],
  live_view: [signing_salt: "Yq/Meaft"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
