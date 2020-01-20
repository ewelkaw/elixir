defmodule FizzBuzz do
  def upto(n) when n > 0, do: _upto(1, n, [])

  defp _upto(current, n, result) when current > n, do: Enum.reverse(result)

  defp _upto(current, n, result) do
    next_answer =
      case {rem(current, 3), rem(current, 5)} do
        {0, 0} ->
          "FizzBuzz"

        {0, _} ->
          "Fizz"

        {_, 0} ->
          "Buzz"

        _ ->
          current
      end

    _upto(current + 1, n, [next_answer | result])
  end
end

# c("11_control_flow/case_fuzz_buzz.exs")
# FizzBuzz.upto(20)
