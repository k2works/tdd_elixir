defmodule TddElixirTest do
  @moduledoc false

  use ExUnit.Case
  doctest TddElixir

  test "greets the world" do
    assert TddElixir.hello() == :world
  end
end
