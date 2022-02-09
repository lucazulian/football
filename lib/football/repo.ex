defmodule Football.Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :football,
    adapter: Ecto.Adapters.Postgres
end
