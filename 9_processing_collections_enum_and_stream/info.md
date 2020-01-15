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
A Stream Is a Composable Enumerator.

```elixir
s = Stream.map [1, 3, 5, 7], &(&1 + 1)
squares = Stream.map [1, 2, 3, 4], &(&1*&1)
plus_ones = Stream.map squares, &(&1+1)
odds = Stream.filter plus_ones, fn x -> rem(x,2) == 1 end
Enum.to_list odds
```
If we’d called Enum.map, we’d have seen the result [2,4,6,8] come back immedi- ately. Instead we get back a stream value that contains a specification of what we intended.
How to get values from Stream?

```elixir
squares = Stream.map [1, 2, 3, 4], &(&1*&1)
Enum.to_list squares

odds = Stream.filter [1, 2, 3, 4], fn x -> rem(x,2) == 1 end
Enum.to_list odds
```
Because streams are enumerable, you can also pass a stream to a stream function. Because of this, we say that streams are composable.

```elixir
squares = Stream.map [1, 2, 3, 4], &(&1*&1)

plus_ones = Stream.map squares, &(&1+1)

odds = Stream.filter plus_ones, fn x -> rem(x,2) == 1 end
Enum.to_list odds
```

Using pipeline it should look like this:
```elixir
[1,2,3,4]
|> Stream.map(&(&1*&1))
|> Stream.map(&(&1+1))
|> Stream.filter(fn x -> rem(x,2) == 1 end) |> Enum.to_list
```

Streams aren’t only for lists. More and more Elixir modules now support streams. For example:

```elixir
File.open!("/usr/share/dict/words") 
|> IO.stream(:line)
|> Enum.max_by(&String.length/1)
|> IO.puts 
```

The magic here is the call to IO.stream, which converts an IO device (in this case the open file) into a stream that serves one line at a time. In fact, there’s a shortcut:
```elixir
IO.puts File.stream!("/usr/share/dict/words") |> Enum.max_by(&String.length/1)
```

**Infinite stream**

Code below will be extremely slow, because Elixir is creating a 10-million- element list, then taking the first five elements from it:
```elixir
Enum.map(1..10_000_000, &(&1+1)) |> Enum.take(5)
```

Using the code below instead, the result comes back instantaneously. The take call just needs five values, which it gets from the stream. Once it has them, there’s no more processing.

```elixir
Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5)
```
In these examples the stream is bounded, but it can equally well go on forever. To do that, we’ll need to create streams based on functions.

**Creating your own stream**
- Stream.cycle

Stream.cycle takes an enumerable and returns an infinite stream containing that enumerable’s elements. When it gets to the end, it repeats from the beginning, indefinitely.

```elixir
Stream.cycle(~w{ green white }) |>
Stream.zip(1..5) |>
Enum.map(fn {class, value} -> "<tr class='#{class}'><td>#{value}</td></tr>\n" end) |>
IO.puts
```

- Stream.repeatedly

Stream.repeatedly takes a function and invokes it each time a new value is wanted.

```elixir
Stream.repeatedly(fn -> true end) |> Enum.take(3)
Stream.repeatedly(&:random.uniform/0) |> Enum.take(3)
```

- Stream.iterate

Stream.iterate(start_value, next_fun) generates an infinite stream. The first value is start_value. The next value is generated by applying next_fun to this value. This continues for as long as the stream is being used, with each value being the result of applying next_fun to the previous value.

```elixir
Stream.iterate(0, &(&1+1)) |> Enum.take(5)
Stream.iterate(2, &(&1*&1)) |> Enum.take(5)
Stream.iterate([], &[&1]) |> Enum.take(5)
```
- Stream.unfold

Stream.unfold is related to iterate, but you can be more explicit both about the values output to the stream and about the values passed to the next iteration. You supply an initial value and a function. The function uses the argument to create two values, returned as a tuple. The first is the value to be returned by this iteration of the stream, and the second is the value to be passed to the function on the next iteration of the stream. If the function returns nil, the stream terminates.
This sounds abstract, but unfold is quite useful—it is a general way of creating a potentially infinite stream of values where each value is some function of the previous state.


The key is the generating function. Its general form is:
`fn state -> { stream_value, new_state } end`

For example, here’s a stream of Fibonacci numbers:

```elixir
Stream.unfold({0,1}, fn {f1,f2} -> {f1, {f2, f1+f2}} end) |> Enum.take(15)
```
Here the state is a tuple containing the current and the next number in the sequence. We seed it with the initial state of {0, 1}. The value each iteration of the stream returns is the first of the state values. The new state moves one down the sequence, so an initial state of {f1,f2} becomes a new state of {f2,f1+f2}.

- Stream.resource

Stream.resource builds upon Stream.unfold. It makes two changes.
The first argument to unfold is the initial value to be passed to the iteration function. But if that value is a resource, we don’t want to open it until the stream starts delivering values, and that might not happen until long after we create the stream. To get around this, resource takes not a value, but a function that returns the value. That’s the first change.

Second, when the stream is done with the resource, we may need to close it. That’s what the third argument to Stream.resource does—it takes the final accumulator value and does whatever is needed to deallocate the resource.
```elixir

Stream.resource(fn -> File.open!("sample") end, 
    fn file ->
        case IO.read(file, :line) do
            data when is_binary(data) -> {[data], file} 
            _ -> {:halt, file}
        end 
    end,
    fn file -> File.close(file) end)
```

Lazy streams let you deal with resources that are asynchronous to your code, and the fact that they are initialized every time they are used means they’re effectively side effect–free. Every time we pipe our stream to an Enum function, we get a fresh set of values, computed at that time.

3. **The Collectable Protocol**


The Enumerable protocol lets you iterate over the elements in a type—given a collection, you can get the elements. Collectable is in some sense the opposite—it allows you to build a collection by inserting elements into it.
Not all collections are collectable. Ranges, for example, cannot have new entries added to them.

The collectable API is pretty low-level, so you’ll typically access it via Enum.into and when using comprehensions (which we cover in the next section). For example, we can inject the elements of a range into an empty list using:

```elixir
Enum.into 1..5, []
Enum.into 1..5, [100, 101]
```
4. **Comprehensions**

The idea of a comprehension is fairly simple: given one or more collections, extract all combinations of values from each, optionally filter the values, and then generate a new collection using the values that remain.
The general syntax for comprehensions is deceptively simple: 
`result = for generator or filter... [, into: value ], do: expression`

```elixir
for x <- [ 1, 2, 3, 4, 5 ], do: x * x
for x <- [ 1, 2, 3, 4, 5 ], x < 4, do: x * x
```
A generator specifies how you want to extract values from a collection.
`pattern <- enumerable_thing`

If we have two generators, their operations are nested, so
`x <- [1,2], y <- [5,6]`

```elixir
for x <- [1, 2], y <- [5, 6], do: x * y
for x <- [1, 2], y <- [5, 6], do: {x, y}

min_maxes = [{1,4}, {2,3}, {10, 15}]
for {min,max} <- min_maxes, n <- min..max, do: n
```
Below the comprehension iterates 64 times, with x=1, y=1; x=1, y=2; and so on. However, the first filter cuts the iteration short when x is less than y. This means the second filter runs only 36 times.

```elixir
first8 = [ 1,2,3,4,5,6,7,8 ]
for x <- first8, y <- first8, x >= y, rem(x*y, 10)==0, do: { x, y }
```

Next comprehension that swaps the keys and values in a keyword list.
```elixir
reports = [ dallas: :hot, minneapolis: :cold, dc: :muggy, la: :smoggy ]
for { city, weather } <- reports, do: { weather, city }
```
**Comprehensions Work on Bits, Too**

A bitstring (and, by extension, a binary or a string) is simply a collection of ones and zeroes. So it’s probably no surprise that comprehensions work on bits, too. What might be surprising is the syntax:

```elixir
for << ch <- "hello" >>, do: ch
for << ch <- "hello" >>, do: <<ch>>
```

The generator is enclosed in << and >>, indicating a binary. 

```elixir
for << << b1::size(2), b2::size(3), b3::size(3) >> <- "hello" >>,  do: "0#{b1}#{b2}#{b3}"
```
**Scoping and Comprehensions**

All variable assignments inside a comprehension are local to that comprehen- sion—you will not affect the value of a variable in the outer scope.

```elixir
name = "Dave"
for name <- [ "cat", "dog" ], do: String.upcase(name)
```

**The Value Returned by a Comprehension**

In our examples thus far, the comprehension has returned a list. The list contains the values returned by the do expression for each iteration of the comprehension.
This behavior can be changed with the into: parameter. This takes a collection that is to receive the results of the comprehension. For example, we can populate a map using:

```elixir
for x <- ~w{ cat dog }, into: %{}, do: { x, String.upcase(x) }
for x <- ~w{ cat dog }, into: Map.new, do: { x, String.upcase(x) }
for x <- ~w{ cat dog }, into: %{"ant" => "ANT"}, do: { x, String.upcase(x)} 
```

The into: option takes values that implement the Collectable protocol. These include lists, binaries functions, maps, files, hash dicts, hash sets, and IO streams, so we can write things such as:

```elixir
for x <- ~w{ cat dog }, into: IO.stream(:stdio,:line), do: "<<#{x}>>\n"
```