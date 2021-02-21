defmodule EpochTest do
  use ExUnit.Case, async: true
  doctest Epoch, import: true

  test "now/0 returns the epoch" do
    now = DateTime.utc_now()
    assert Epoch.now() == DateTime.to_unix(now)
  end

  test "now/1 returns the epoch with microsecond precision" do
    now = DateTime.utc_now() |> DateTime.to_unix()

    assert Epoch.now(:microsecond) |> String.match?(~r/#{now}\.\d{6}$/)
  end
end
