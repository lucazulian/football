defmodule Football.Commands.Create do
  @moduledoc false

  defstruct [:item_id]

  @type t :: %__MODULE__{
          item_id: String.t() | nil
        }
end
