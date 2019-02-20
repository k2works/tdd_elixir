defmodule FizzBuzz do
  def print(), do: generate_list() |> Enum.map &IO.puts/1

  def generate_list(), do: 1..100 |> Enum.map &generate/1

  def generate(number) do
    case {_fizz?(number), _buzz?(number)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      {_, _} -> number
    end
  end

  defp _fizz?(number), do: rem(number, 3)
  defp _buzz?(number), do: rem(number, 5)
end
