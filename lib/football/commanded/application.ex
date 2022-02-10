defmodule Football.Commanded.Application do
  @moduledoc false

  use Commanded.Application,
    otp_app: :football,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: Football.EventStore
    ]

  router Football.Commanded.Router
end
