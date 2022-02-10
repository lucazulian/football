import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :football, Football.Repo,
  username: "football",
  password: "football",
  hostname: System.get_env("POSTGRES_HOST") || "football-db",
  port: System.get_env("POSTGRES_PORT") || 5432,
  database: "football_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :football, Football.App, event_store: [adapter: Commanded.EventStore.Adapters.InMemory]

config :football, Football.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "football",
  password: "football",
  hostname: System.get_env("POSTGRES_HOST") || "football-db",
  port: System.get_env("POSTGRES_PORT") || 5432,
  database: "football_eventstore",
  pool_size: 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :football, FootballWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "7Fqm5jZfND8lUAHdwH+jjnTXNbZ+/6LR1Lm7OEeTIHuuV5wisls3zz13J4Js9Wr2",
  server: false

# In test we don't send emails.
config :football, Football.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
