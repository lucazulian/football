defmodule Football.Commanded.Router do
  @moduledoc false

  use Commanded.Commands.Router

  dispatch Football.Commands.CreateMatch,
    to: Football.Aggregates.Match,
    identity: :id
end
