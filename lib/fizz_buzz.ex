defmodule FizzBuzz do
  def print(), do: generate_list() |> Enum.map &IO.puts/1

  def generate_list(), do: 1..100 |> Enum.map &generate/1

  def generate(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: "FizzBuzz"
  def generate(number) when rem(number, 3) == 0 , do: "Fizz"
  def generate(number) when rem(number, 5) == 0 , do: "Buzz"
  def generate(number), do: number
end
