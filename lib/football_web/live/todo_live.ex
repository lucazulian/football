defmodule FootballWeb.TodoLive do
  @moduledoc false

  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Todo list</h1>
    """
  end
end
