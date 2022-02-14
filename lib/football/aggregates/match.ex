defmodule Football.Aggregates.Match do
  @moduledoc false

  defstruct id: nil

  @type t :: %__MODULE__{
          id: String.t() | nil
        }

  alias Football.Commands, as: C
  alias Football.Events, as: E

  require Logger

  def execute(%__MODULE__{id: nil}, %C.CreateMatch{id: id}) do
    %E.MatchCreated{id: id}
  end

  def apply(%__MODULE__{} = match, %E.MatchCreated{id: id}) do
    %{match | id: id}
  end

  def apply(%__MODULE__{} = item, command) do
    Logger.warn("ignoring command on apply #{inspect(command)}")
    item
  end
end
