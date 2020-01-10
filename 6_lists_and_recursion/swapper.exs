defmodule Swapper do
def swap([]), do: []
def swap([ a, b | tail ]), do: [ b, a | swap(tail) ]
def swap([_]), do: raise "Can't swap a list with an odd number of elements"
end

# c "lists_and_recursion/swapper.exs"
# Swapper.swap([1,2])
# Swapper.swap([2])
# Swapper.swap([1,2,3,4,5,6])

