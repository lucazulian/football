defmodule FootballWeb.PageController do
  use FootballWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
