# We leave configuration responsibility to the apps and import their config here to properly
# configure the umbrella project

import Config

for config <- "../apps/*/config/config.exs" |> Path.expand(__DIR__) |> Path.wildcard() do
  import_config config
end

config :messaging, Messaging.Endpoint,
  http: [port: 4000]