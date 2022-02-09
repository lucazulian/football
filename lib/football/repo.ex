defmodule Football.Repo do
  use Ecto.Repo,
    otp_app: :football,
    adapter: Ecto.Adapters.Postgres
end
