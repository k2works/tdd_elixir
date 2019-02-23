defmodule FizzBuzz do
  @max_range 100
  @moduledoc false
  def print, do: generate_list(@max_range) |> Enum.map(&IO.puts/1)
  def generate_list(max_range), do: 1..max_range |> Enum.map(&generate/1)

  def generate(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: "FizzBuzz"
  def generate(number) when rem(number, 3) == 0, do: "Fizz"
  def generate(number) when rem(number, 5) == 0, do: "Buzz"
  def generate(number), do: number
end
