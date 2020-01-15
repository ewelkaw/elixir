defmodule Chop do
  def guess(n, a..b) when n < a + div(b - a, 2) do
    IO.puts("#{n} is in range #{a} #{div(b, 2) - 1}")
    IO.inspect(a..b)
    guess(n, a..(a + div(b - a, 2) - 1))
  end

  def guess(n, a..b) when n > a + div(b - a, 2) do
    IO.puts("#{n} is in range #{div(b, 2) + 1} #{b}")
    IO.inspect(a..b)
    guess(n, (a + div(b - a, 2))..b)
  end

  def guess(n, a..b) when n == a + div(b - a, 2) do
    IO.puts("#{n} is equal #{a + div(b - a, 2)}")
    IO.puts(n)
  end
end

#  c "modules_and_named_functions/guess.exs"
# Chop.guess(273, 1..1000)
