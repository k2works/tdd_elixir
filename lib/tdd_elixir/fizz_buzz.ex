defmodule FizzBuzz do
  @max_range 100
  @moduledoc false
  def print, do: generate_list(@max_range) |> Enum.map(&IO.puts/1)
  def generate_list(max_range), do: 1..max_range |> Enum.map(&generate/1)

  def generate(number) do
    cond do
      _fizz?(number) and _buzz?(number) -> "FizzBuzz"
      _fizz?(number) -> "Fizz"
      _buzz?(number) -> "Buzz"
      true -> number
    end
  end

  defp _fizz?(number), do: rem(number, 3) == 0
  defp _buzz?(number), do: rem(number, 5) == 0
end
