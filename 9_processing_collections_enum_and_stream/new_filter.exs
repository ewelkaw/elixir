# defmodule MyFilter do
#     def new_filter(list, condition) do
#         for element <- list do
#             if condition.(element) do 
#                 element
#             end
#         end
#     end
# end

defmodule MyFilter do
    def new_filter([], condition),     do: []
    def new_filter([head | tail], condition) do
        if condition.(head) do
            [head | new_filter(tail, condition)]
        else 
            new_filter(tail, condition)
        end
    end
end

# c "9_processing_collections_enum_and_stream/new_filter.exs"
# MyFilter.new_filter([1,12,23], fn n -> n > 10 end)