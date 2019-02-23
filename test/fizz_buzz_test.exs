
defmodule FizzBuzzTest do
  @moduledoc false

  use ExUnit.Case
  doctest FizzBuzz

  test "Hello, world!" do
    assert FizzBuzz.greeting() == "Hello, world!"
  end
end
