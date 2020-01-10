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

Using head and tail, let's write a function that takes a list of numbers and returns a new list containing a square of it. 

```elixir
def square([]),             do: []
def square([head | tail]),  do: [head*head] ++ square([tail])
```

- **Creating a map function**

Map is a function that takes a list and returns a new list containing the result of applying that function to each element of the original. We need to add underscore in first map, because function is not used.

```elixir
def map([], _func),                    do: []
def map([head|tail], func)      do: [func(head) | map(tail, func)] 
```

- **Reducing a list to a single value**

If we want to apply function across the elements we can create an abstraction that will let us for example sum a list, or find the product of its elements, or find the largest element

```elixir
defmodule MyList do
    def reduce([], value, _), do: value
    def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)
end

iex> c "reduce.exs"
iex> MyList.reduce([1,2,3,4,5], 0, &(&1 + &2)) # 15
iex> MyList.reduce([1,2,3,4,5], 1, &(&1 * &2)) # 120
```

- **More complex list patterns - filtering**
We should remember we can write:
`[1,2,3,4|[1,2,3]]`

We can also prepare swapper, which is raising error when having only one element left (which is not swapable).
```elixir
defmodule Swapper do
def swap([]), do: []
def swap([ a, b | tail ]), do: [ b, a | swap(tail) ]
def swap([_]), do: raise "Can't swap a list with an odd number of elements"
end
```

We can also have a `list of lists` like this:
`[rimestamp, location, temperature, rainfall]`

Now, we will focus on filtering data in a very different ways.

### 1 ###
```elixir
defmodule WeatherHistory do
    def for_location_27([]), do: []
    def for_location_27([ [time, 27, temp, rain ] | tail]) do
        [ [time, 27, temp, rain] | for_location_27(tail) ]
    end
    def for_location_27([ _ | tail]), do: for_location_27(tail)
end

[
   [1366225622, 26, 15, 0.125],
   [1366225622, 27, 15, 0.45],
   [1366225622, 28, 21, 0.25],
   [1366229222, 26, 19, 0.081],
   [1366229222, 27, 17, 0.468],
   [1366229222, 28, 15, 0.60],
   [1366232822, 26, 22, 0.095],
   [1366232822, 27, 21, 0.05],
   [1366232822, 28, 24, 0.03],
   [1366236422, 26, 17, 0.025]
]

WeatherHistory.for_location_27(data)
```
### 2 we can choose target_loc ###
```elixir
defmodule WeatherHistory do
    def for_location([], _target_loc), do: []
    def for_location([ [time, target_loc, temp, rain ] | tail], target_loc) do [ [time, target_loc, temp, rain] | for_location(tail, target_loc) ]
    end
    def for_location([ _ | tail], target_loc), do: for_location(tail, target_loc) 
end

[
   [1366225622, 26, 15, 0.125],
   [1366225622, 27, 15, 0.45],
   [1366225622, 28, 21, 0.25],
   [1366229222, 26, 19, 0.081],
   [1366229222, 27, 17, 0.468],
   [1366229222, 28, 15, 0.60],
   [1366232822, 26, 22, 0.095],
   [1366232822, 27, 21, 0.05],
   [1366232822, 28, 24, 0.03],
   [1366236422, 26, 17, 0.025]
]

WeatherHistory.for_location_27(data, 26)
```

### 3 we can choose target_loc ###
```elixir
defmodule WeatherHistory do
    def for_location([], _target_loc), do: []
    def for_location([ head = [_, target_loc, _, _ ] | tail], target_loc) do [ head | for_location(tail, target_loc) ]
    end
    def for_location([ _ | tail], target_loc), do: for_location(tail, target_loc) 
end

[
   [1366225622, 26, 15, 0.125],
   [1366225622, 27, 15, 0.45],
   [1366225622, 28, 21, 0.25],
   [1366229222, 26, 19, 0.081],
   [1366229222, 27, 17, 0.468],
   [1366229222, 28, 15, 0.60],
   [1366232822, 26, 22, 0.095],
   [1366232822, 27, 21, 0.05],
   [1366232822, 28, 24, 0.03],
   [1366236422, 26, 17, 0.025]
]

WeatherHistory.for_location_27(data, 26)
```

- **The list module in action**
The list module  provides  a set of functions that operate on lists

1. Concatenate
```elixir
[1,2,3] ++ [4,5,6]
```
2. Flatten
```elixir
List.flatten([[1], [2], [[3]]])     # [1, 2, 3]
```
3. Folding (like reduce, but can choose direction)
```elixir
List.foldr([1,2,3], "", fn(value, acc) -> "#{value}(#{acc})" end)  # "1(2(3()))"
List.foldl([1,2,3], "", fn(value, acc) -> "#{value}(#{acc})" end)  # "3(2(1()))"
```
4. Updating in the middle (not a cheap operation)
```elixir
list = [1,2,3]
List.replace_at(list, 2, "shoe")    # [1, 2, "shoe"]
```
5. Accessing tuples with list
```elixir
kw = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]
List.keyfind(kw, "Dallas", 1)
List.keyfind(kw, "TX", 2)
List.keyfind(kw, "TX", 1)
List.keyfind(kw, "TX", 1, "No city called TX")
kw = List.keydelete(kw, "TX", 2)
kw = List.keyreplace(kw, :name, 0, {:first_name, "Dave"})
```