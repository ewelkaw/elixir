defmodule MyList do
    def square([]),             do: []
    def square([head | tail]),  do: [head*head | square(tail)]
end

#  c "lists_and_recursion/square.exs"
# MyList.square([1,2,3])
# MyList.square([])