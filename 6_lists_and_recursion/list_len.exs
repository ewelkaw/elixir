defmodule MyList do
    def len([]),            do: 0
    def len([_head|tail]),  do: 1 + len(tail)
end

#  c "lists_and_recursion/list_len.exs"
# MyList.len([1,2,3])
# MyList.len([])