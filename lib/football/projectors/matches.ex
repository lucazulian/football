defmodule Football.Projections.MatchesProjector do
  @moduledoc false

  use Commanded.Projections.Ecto,
    application: Football.Commanded.Application,
    name: "Football.Projections.MatchesProjector",
    consistency: :strong,
    start_from: :origin

  alias Football.Events, as: E
  alias Football.Projections.MatchesProjection

  project %E.MatchCreated{id: id}, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :matches, %MatchesProjection{id: id})
  end
end
