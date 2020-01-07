- **Heads and tails**

List can be divided into head (first element) and tail (the rest of the list).
Consider that we have list like this [3]. Lets try to divide head and tail of list with pipe `|`.
[3 | [] ]

```elixir
iex> [a,b,c] = [1,2,3]
iex> a
iex> b
iex> c
```

```elixir
iex> [head | tail] = [1,2,3]
iex> head
iex> tail
```

Having this knowledge we can prepare algorithm for list-length usng head and tail. We need to remember to add underscore to `head` variable, because it is never used in the body of the function.

```elixir
defmodule MyList do
    def len([]), do 0
    def len([_head|tail]), do 1 + len(tail)
end

iex> c "lists_and_recursion/my_list.exs"
iex> MyList.len([1,2,3])
iex> MyList.len([])
```

- **Using head and tail to build a list**

Now, let's write a function that takes a list of numbers and returns a new list containing a square of it. 

```elixir
def square([]),             do: []
def square([head | tail]),  do: [head*head] ++ square([tail])
```

- **Creating a map function**

Now, we will define a function called map that takes a list and a a function and returns a new list containing the result of applying that function to each element of the original. We need to add underscore in first map, because function is not used.

```elixir
def map([], _func),                    do: []
def map([head|tail], func)      do: [func(head) | map(tail, func)] 
```

- **Reducing a list to a single value**
```elixir
```

- **More complex list patterns**
```elixir
```

- **The list module in action**
```elixir
```
