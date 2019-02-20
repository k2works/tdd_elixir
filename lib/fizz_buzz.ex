defmodule FizzBuzz do
  def print(), do: generate_list() |> Enum.map &IO.puts/1

  def generate_list(), do: 1..100 |> Enum.map &generate/1

  def generate(number) do
    fizz = rem(number, 3) == 0
    buzz = rem(number, 5) == 0

    cond do
      fizz and buzz -> "FizzBuzz"
      fizz -> "Fizz"
      buzz -> "Buzz"
      true -> number
    end
  end
end
