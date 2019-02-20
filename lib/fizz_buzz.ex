defmodule FizzBuzz do
  def print(), do: generate_list() |> Enum.map &IO.puts/1

  def generate_list(), do: 1..100 |> Enum.map &generate/1

  def generate(number) do
    cond do
      rem(number, 3) == 0 and rem(number, 5) == 0 -> "FizzBuzz"
      rem(number, 3) == 0 -> "Fizz"
      rem(number, 5) == 0 -> "Buzz"
      true -> number
    end
  end
end
