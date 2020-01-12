defmodule MyEach do
    def new_each(list), do: for element <- list, do: IO.puts(element)
end

# c "9_processing_collections_enum_and_stream/new_each.exs"
# MyEach.new_each(["user1", "user2"])