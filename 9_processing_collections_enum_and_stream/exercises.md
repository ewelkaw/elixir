1. Implement the following Enum functions using no library functions or list comprehensions: all?, each, filter, split, and take. You may need to use an if statement to implement filter. The syntax for this is:
```elixir
if condition do 
    expression(s)
else
    expression(s)
end
```

**SOLUTION**:

IO.inspect(for person = %{ height: height } <- people, height > 1.5, do: person)

- all?

```elixir
list1 = [1, 0, 0, 1]
list2 = [1, 2, 3, 4, 5]
Enum.reduce(list, false, fn elem, acc -> Enum.max([(elem>3), acc]) end)
```

- each
```elixir
defmodule MyEach do
    def new_each(list), do: for element <- list, do: IO.puts(element)
end

MyEach.new_each(["user1", "user2"])
```

- filter
```elixir
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

MyFilter.new_filter([1,12,23], fn n -> n > 10 end)
```

- split
```elixir
defmodule MySplit do
    def split(list, x),                                     do: new_split(list, [], [], x, x)
    def new_split([], _left, _right, _n, _m),               do: []
    def new_split(list, left, right, n, m) when n > 0,      do: new_split(list, List.insert_at(left, 0, Enum.at(list, n-1)), right, n-1, m)
    def new_split(list, left, right, n, m) when n == 0,     do: [left, right ++ Enum.slice(list, m..length(list))]
end

MySplit.split([1,12,23,32,12,89], 4)
```

- take
```elixir
defmodule MyTake do
    def take(list, n),                                 do: new_take(list, n, [])
    def new_take([], _n, _taken_list),                 do: []
    def new_take(list, n, taken_list) when n > 0,      do: new_take(list, n-1, List.insert_at(taken_list,0, Enum.at(list, n-1)))
    def new_take(_list, n, taken_list) when n == 0,     do: taken_list
end

MyTake.take([1,12,23,32,12,89], 2)
```