defmodule Football.Commands.CreateMatch do
  @moduledoc false

  defstruct [:id]

  @type t :: %__MODULE__{
          id: String.t() | nil
        }
end
