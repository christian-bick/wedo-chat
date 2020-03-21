defmodule Messaging.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # List all child processes to be supervised
    children = [
      Messaging.Endpoint,
      worker(
        Mongo,
        [
          [
            name: :mongo,
            hostname: "mongodb",
            database: "admin",
            pool_size: 3,
            username: "root",
            password: "root"
          ]
        ]
      ),
      {Redix, name: :redis, host: "redis"}
    ]
    opts = [strategy: :one_for_one, name: Messaging.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Messaging.Endpoint.config_change(changed, removed)
    :ok
  end
end
