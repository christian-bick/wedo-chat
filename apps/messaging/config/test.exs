import Config

config :messaging, Messaging.Endpoint,
  http: [port: System.get_env("PORT") || 8081],
  server: false
