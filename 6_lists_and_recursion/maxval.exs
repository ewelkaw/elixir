defmodule MyList do
  def maxval([]), do: nil
  def maxval([head | tail]), do: compare(head, maxval(tail))

  defp compare(nil, b), do: b
  defp compare(a, nil), do: a
  defp compare(a, b) when a > b, do: a
  defp compare(a, b) when a <= b, do: b
end

# c 'lists_and_recursion/maxval.exs'
# MyList.maxval([])
# MyList.maxval([4,1,2,3,100, -10])
defmodule Comparer do
  def compare(nil, x), do: x
  def compare(x, nil), do: x
  def compare(x, y), do: if(x > y, do: x, else: y)
end

defmodule MyList do
  def max(list), do: maxval(list, &Comparer.compare/2)

  def maxval([], _func), do: nil
  def maxval([head | tail], func), do: func.(head, maxval(tail, func))
end

# MyList.maxval([], &Comparer.compare/2)
# MyList.max([])
# MyList.max([1,2,3,4])
# MyList.max([100,2,3,4])
