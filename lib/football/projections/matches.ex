defmodule Football.Projections.MatchesProjection do
  @moduledoc false

  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: false}

  schema "matches" do
    timestamps()
  end
end
