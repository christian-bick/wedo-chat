import Config

config :messaging, Messaging.Endpoint,
  http: [port: System.get_env("PORT") || 8080],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []