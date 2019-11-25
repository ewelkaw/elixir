defmodule Chop do
    def guess(n, a..b) when n < div(b, 2) do
        IO.puts "1 Is it #{div(b, 2)}"
        IO.inspect(a..b)
        guess(n, a..div(b, 2))
    end

    def guess(n, a..b) when n > div(b, 2) do
        IO.puts "2 Is it #{div(b, 2)}"
        IO.inspect(a..b)
        guess(n, div(b, 2)..b)
    end

    def guess(n, a..b) when n == div(b, 2) do
        IO.puts n
    end
end
#  c "guess.exs"
# Chop.guess(273, 1..1000)