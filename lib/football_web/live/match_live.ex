defmodule FootballWeb.MatchLive do
  @moduledoc false

  use Phoenix.LiveView

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_event("create", _, socket) do
    :ok =
      Football.Commanded.Application.dispatch(%Football.Commands.CreateMatch{id: UUID.uuid4()})

    {:noreply, socket}
  end
end
