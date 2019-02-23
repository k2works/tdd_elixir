defmodule FizzBuzz do
  @moduledoc false
  def print do
    list = generate_list()
    Enum.map(list, fn value -> IO.puts(value) end)
  end

  def generate_list() do
    range = 1..100
    Enum.map(range, fn number -> generate(number) end)
  end

  def generate(number) do
    cond do
      rem(number, 3) == 0 and rem(number, 5) == 0 -> "FizzBuzz"
      rem(number, 3) == 0 -> "Fizz"
      rem(number, 5) == 0 -> "Buzz"
      true -> number
    end
  end
end
