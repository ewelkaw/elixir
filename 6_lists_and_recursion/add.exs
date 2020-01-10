defmodule MyList do
    def add1([]),           do: []
    def add1([head|tail]),  do: [head+1|add1(tail)]
end

#  c "lists_and_recursion/add.exs"
# MyList.add([1,2,3])
# MyList.add([])