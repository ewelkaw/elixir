defmodule CaesarList do
  def caesar([], _val), do: []
  def caesar([head | tail], val), do: [run_caesar(head, val)] ++ caesar(tail, val)

  def run_caesar(n, val),
    do: if(div(val, 97) > 0, do: n + (val - div(val, 97) * 97), else: n + val)
end

# c "lists_and_recursion/caesar.exs"
# CaesarList.caesar([], 0)
# CaesarList.caesar('abc', 4)
