# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :football,
  ecto_repos: [Football.Repo],
  event_stores: [Football.EventStore]

# Configures the endpoint
config :football, FootballWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: FootballWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Football.PubSub,
  live_view: [signing_salt: "RuwVbzLo"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :football, Football.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  # format: "$time $metadata[$level] aaaa $message\n",
  format: {Football.Support.LoggerFormatter, :format},
  metadata: :all,
  utc_log: true,
  handle_otp_reports: true

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :football, Football.Commanded.Application,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: Football.EventStore
  ],
  pub_sub: :local,
  registry: :local

config :commanded_ecto_projections,
  repo: Football.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
