defmodule MyList do
    def mapsum([], _func),          do: 0
    def mapsum([head|tail], func),  do: func.(head) + mapsum(tail, func)
end

# c "lists_and_recursion/mapsum.exs"
# MyList.mapsum([1,2,3,4,5], fn(n) -> n+1 end)
# MyList.mapsum([1,2,3,4,5], fn (n) -> n*n end)