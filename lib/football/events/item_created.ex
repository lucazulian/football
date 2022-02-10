defmodule Football.Events.ItemCreated do
  @moduledoc false

  @derive Jason.Encoder
  defstruct [:item_id]

  @type t :: %__MODULE__{
          item_id: String.t() | nil
        }
end
