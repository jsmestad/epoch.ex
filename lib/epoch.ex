defmodule Epoch do
  @type epoch :: integer
  @type epoch_in_ms :: String.t()
  @type datetime :: DateTime.t()

  @moduledoc """
  Conversion between Elixir native `DateTime.t/0` and epoch formats.
  """

  @doc """
  Returns the current time in epoch format.
  """
  @spec now :: epoch
  def now do
    DateTime.utc_now() |> DateTime.to_unix()
  end

  @doc """
  Returns the current time in epoch format with millisecond resolution.
  """
  @spec now(:microsecond) :: epoch_in_ms
  def now(:microsecond) do
    cast(DateTime.utc_now())
  end

  @doc """
  Accepts a DateTime and converts it to epoch with microseconds.

  ## Examples

      iex> cast(~U[2020-12-20 02:26:29.000800Z])
      "1608431189.000800"

      iex> cast(~U[2020-12-20 02:26:29Z])
      "1608431189.000000"

  """
  @spec cast(datetime) :: epoch_in_ms
  def cast(%DateTime{} = time) do
    epoch_in_ms = DateTime.to_unix(time, :microsecond)
    :erlang.float_to_binary(epoch_in_ms / 1_000_000.00, decimals: 6)
  end

  @doc """
  Returns seconds since epoch for the given `DateTime.t/0`.

  ## Examples

      iex> seconds_since(~U[2020-12-20 02:26:29.000800Z])
      1608431189

      iex> seconds_since(~U[2020-12-20 02:26:29Z])
      1608431189

  """
  @spec seconds_since(datetime) :: epoch
  def seconds_since(%DateTime{} = time) do
    DateTime.to_unix(time, :second)
  end

  @doc """
  Converts an epoch with microseconds to a `DateTime.t/0`

  ## Examples

      iex> to_datetime("1608431189.000800")
      ~U[2020-12-20 02:26:29.000800Z]

      iex> to_datetime("1608431189")
      ~U[2020-12-20 02:26:29Z]

      iex> to_datetime(1_608_431_189)
      ~U[2020-12-20 02:26:29Z]

  """
  @spec to_datetime(epoch_in_ms | epoch) :: datetime
  def to_datetime(epoch) when is_binary(epoch) do
    if String.contains?(epoch, ".") do
      epoch
      |> String.replace(".", "")
      |> String.to_integer()
      |> DateTime.from_unix!(:microsecond)
    else
      epoch
      |> String.to_integer()
      |> DateTime.from_unix!()
    end
  end

  def to_datetime(epoch) when is_integer(epoch) do
    DateTime.from_unix!(epoch)
  end
end
