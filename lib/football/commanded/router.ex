defmodule Football.Commanded.Router do
  @moduledoc false

  use Commanded.Commands.Router

  dispatch Football.Commands.Create,
    to: Football.Aggregates.Item,
    identity: :item_id
end
