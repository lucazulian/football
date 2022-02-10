defmodule Football.Aggregates.Item do
  @moduledoc false

  defstruct id: nil

  @type t :: %__MODULE__{
          id: String.t() | nil
        }

  alias Football.Commands, as: C
  alias Football.Events, as: E

  require Logger

  def execute(%__MODULE__{id: nil}, %C.Create{item_id: item_id}) do
    %E.ItemCreated{item_id: item_id}
  end

  def apply(%__MODULE__{} = item, %E.ItemCreated{item_id: item_id}) do
    %{item | id: item_id}
  end

  def apply(%__MODULE__{} = item, command) do
    Logger.warn("ignoring command on apply #{inspect(command)}")
    item
  end
end
