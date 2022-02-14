defmodule Football.Events.MatchCreated do
  @moduledoc false

  @derive Jason.Encoder
  defstruct [:id]

  @type t :: %__MODULE__{
          id: String.t() | nil
        }
end
