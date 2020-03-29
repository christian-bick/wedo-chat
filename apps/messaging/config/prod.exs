import Config

config :messaging, Messaging.Endpoint,
  url: [host: "example.com", port: System.get_env("PORT") || 8080],
  http: [port: System.get_env("PORT") || 8080],
  cache_static_manifest: "priv/static/cache_manifest.json"