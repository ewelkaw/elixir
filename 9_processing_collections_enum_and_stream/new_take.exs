# defmodule MyTake do
#     def new_take([], _n),   do: []
#     def new_take(list, n),   do: Enum.slice(list, 0..n-1)
# end

# c "9_processing_collections_enum_and_stream/new_take.exs"
# MyTake.new_take([1,12,23,32,12,89], 2)


defmodule MyTake do
    def take(list, n),                                 do: new_take(list, n, [])
    def new_take([], _n, _taken_list),                 do: []
    def new_take(list, n, taken_list) when n > 0,      do: new_take(list, n-1, List.insert_at(taken_list,0, Enum.at(list, n-1)))
    def new_take(_list, n, taken_list) when n == 0,     do: taken_list
end

# c "9_processing_collections_enum_and_stream/new_take.exs"
# MyTake.new_take([1,12,23,32,12,89], 2, [])
# MyTake.take([1,12,23,32,12,89], 2)