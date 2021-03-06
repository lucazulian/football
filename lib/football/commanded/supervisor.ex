defmodule Football.Commanded.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    Supervisor.init(children(), strategy: :one_for_one)
  end

  defp children do
    [
      Football.Commanded.Application,
      Football.Handlers.EmailSender,
      Football.Projections.MatchesProjector
    ]
  end
end
