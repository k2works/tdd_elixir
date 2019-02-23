defmodule FizzBuzz do
  @moduledoc false
  def print, do: Enum.map(generate_list(), fn value -> IO.puts(value) end)
  def generate_list(), do: Enum.map(1..100, fn number -> generate(number) end)

  def generate(number) do
    cond do
      rem(number, 3) == 0 and rem(number, 5) == 0 -> "FizzBuzz"
      rem(number, 3) == 0 -> "Fizz"
      rem(number, 5) == 0 -> "Buzz"
      true -> number
    end
  end
end
