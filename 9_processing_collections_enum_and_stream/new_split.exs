defmodule MySplit do
    def split(list, x),                                     do: new_split(list, [], [], x, x)
    def new_split([], _left, _right, _n, _m),               do: []
    def new_split(list, left, right, n, m) when n > 0,      do: new_split(list, List.insert_at(left, 0, Enum.at(list, n-1)), right, n-1, m)
    def new_split(list, left, right, n, m) when n == 0,     do: [left, right ++ Enum.slice(list, m..length(list))]
end

# c "9_processing_collections_enum_and_stream/new_split.exs"
# MySplit.new_split([1,12,23,32,12,89], [], [], 4, 4)
# MySplit.split([1,12,23,32,12,89], 4)
