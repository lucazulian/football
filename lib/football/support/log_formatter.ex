defmodule Football.Support.LoggerFormatter do
  @moduledoc """
  Custom Formatter
  """

  use Timex

  def format(level, message, timestamp, metadata) do
    message
    |> Jason.decode()
    |> case do
      {:ok, msg} -> msg
      {:error, _} -> %{msg: message}
    end
    |> json_msg_format(level, timestamp, metadata)
    |> new_line()
  end

  defp json_msg_format(message, level, timestamp, metadata) do
    %{
      timestamp: fmt_timestamp_to_iso(timestamp),
      level: level,
      message: message,
      module: fmt_module(metadata),
      function: fmt_function(metadata),
      line: fmt_line(metadata),
      request_id: fmt_request_id(metadata)
    }
    |> Jason.encode()
    |> case do
      {:ok, msg} -> msg
      {:error, reason} -> %{error: reason} |> Jason.encode()
    end
  end

  defp new_line(msg), do: "#{msg}\n"

  defp fmt_module(metadata), do: metadata[:module]

  defp fmt_function(metadata), do: metadata[:function]

  defp fmt_line(metadata), do: metadata[:line]

  defp fmt_request_id(metadata), do: metadata[:request_id] || nil

  defp fmt_timestamp_to_iso({{year, month, day}, {hour, minute, second, millisecond}}) do
    case NaiveDateTime.new(
           year,
           month,
           day,
           hour,
           minute,
           second,
           millisecond * 1_000
         ) do
      {:ok, ts} ->
        ts
        |> Timex.to_datetime()
        |> Timezone.convert("Etc/UTC")
        |> Timex.format!("{ISO:Extended}")

      _ ->
        nil
    end
  end
end
