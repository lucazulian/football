defmodule FootballWeb.MatchLive do
  @moduledoc false

  use Phoenix.LiveView

  alias Football.Commanded.Application
  alias Football.Commands, as: C

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_event("create", _, socket) do
    :ok = Application.dispatch(%C.CreateMatch{id: UUID.uuid4()})
    {:noreply, socket}
  end
end
