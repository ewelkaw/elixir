defmodule MyList do
  def reduce([], value, _func), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)
end

# c "lists_and_recursion/reduce.exs"
# MyList.reduce([1,2,3,4,5], 0, &(&1 + &2))
# MyList.reduce([1,2,3,4,5], 0, &(&1 + &2))
