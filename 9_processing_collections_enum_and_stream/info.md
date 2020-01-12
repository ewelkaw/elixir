Types that act as collections:
    - list
    - map
    - range can act like collection
    - file can act like collection
    - function can act like collection
    - we can defin our own

Very important feature of collections is that we can iterate through them.
Technically, things that can be iterated are said to implement the Enumerable protocol.

Elixir provides two modules that have a bunch of iteration functions:
- `Enum` module is the workhorse for collections
- `Stream` module lets you enumerate a collection lazily

1. **Enum—Processing Collections**

- converting any collection to a list
```elixir
list = Enum.to_list(1..5)
```

- concatenate collections
```elixir
Enum.concat([1,2,3], [4,5,6])
Enum.concat([1,2,3], 'abc')
```

- create collections whose element are some fucntion of the original
```elixir
Enum.map(list, &(&1*10))
Enum.map(list, &String.duplicate("*", &1))
```

- select elements by position or criteria
```elixir
Enum.at(10..20, 3)
Enum.at(10..20, 20)
Enum.at(10..20, 20, :no_one_here)
Enum.filter(list, &(&1>2))

require Integer
Enum.filter(list, &Integer.is_even/1)
Enum.reject(list, &Integer.is_even/1)
```

- sort and compare element
```elixir
Enum.sort ["there", "was", "a", "crooked", "man"]
Enum.sort ["there", "was", "a", "crooked", "man"], &(String.length(&1) <= String.length(&2))
Enum.max ["there", "was", "a", "crooked", "man"]
Enum.max_by ["there", "was", "a", "crooked", "man"], &String.length/1
```

- split a collection
```elixir
Enum.take(list, 3)
Enum.take_every(list, 2)
Enum.take_while(list, &(&1 < 4))
Enum.split(list, 3)
Enum.split_while(list, &(&1 < 4))
```

- join a collection
```elixir
Enum.join(list)
Enum.join(list, ", ")
```

- predicate operations
```elixir
Enum.all?(list, &(&1 < 4))
Enum.any?(list, &(&1 < 4))
Enum.member?(list, 4)
Enum.empty?(list)
```

- merge collections
```elixir
Enum.zip(list, [:a, :b, :c])
Enum.with_index(["once", "upon", "a", "time"])
```

- fold elements into a single value
```elixir
Enum.reduce(1..100, &(&1+&2))

Enum.reduce(["now", "is", "the", "time"], fn word, longest ->
    if String.length(word) > String.length(longest) do
        word
    else
        longest
    end
end)
<!-- "time" -->

Enum.reduce(["now", "is", "the", "time"], 0, fn word, longest ->
    if String.length(word) > longest, 
    do: String.length(word),
    else: longest
end)

<!-- 4 -->
```


- deal a hand of cards
```elixir
import Enum
deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]
deck |> shuffle |> take(13)
hands = deck |> shuffle |> chunk(13)
```

- SORTING NOTE

In our example of sort, we used
```elixir
Enum.sort ["there", "was", "a", "crooked", "man"], &(String.length(&1) <= String.length(&2))
```
It’s important to use <= and not just < if you want the sort to be stable.

2. **Streams—Lazy Enumerables**

In Elixir, the Enum module is greedy. This means that when you pass it a collec- tion, it potentially consumes all the contents of that collection. It also means the result will typically be another collection.

```elixir
list = [ 1, 2, 3, 4, 5 ]
Enum.map(list, &(&1*&1))

```
3. **The Collectable Protocol**
```elixir
```
4. **Comprehensions**
```elixir
```