defmodule MyMap do
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]
end

# c "lists_and_recursion/my_map.exs"
# MyMap.map([1,2,3,4], fn (n) -> n*n end)
# MyMap.map([], fn (n) -> n*n end)
# MyMap.map([1,2,3,4], fn (n) -> n>3 end)
# MyMap.map([], fn (n) -> n>3 end)
