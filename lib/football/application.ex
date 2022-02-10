defmodule Football.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, env: env) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Football.Supervisor]

    env
    |> children()
    |> Supervisor.start_link(opts)
  end

  defp children(:test) do
    children()
  end

  defp children(_) do
    children() ++ [Football.Commanded.Application]
  end

  defp children do
    [
      # Start the Ecto repository
      Football.Repo,
      # Start the Telemetry supervisor
      FootballWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Football.PubSub},
      # Start the Endpoint (http/https)
      FootballWeb.Endpoint
      # Start a worker by calling: Football.Worker.start_link(arg)
      # {Football.Worker, arg},
    ]
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FootballWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
