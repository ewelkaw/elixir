-**How to choose between maps, structs and keyword lists**

A dictionary is a data type that associates keys with values. The hardest thing is to choose an appropriate dictionary type fora particular need. 

Ask yourself these questions (in this order):
    
    • Do I want to pattern-match against the contents (for example, matching a dictionary that has a key of :name somewhere in it)?

`If so, use a map.`

    • Will I want more than one entry with the same key?

`If so, you’ll have to use the Keyword module.`

    • Do I need to guarantee the elements are ordered?

`If so, again, use the Keyword module.`

    • Do I have a fixed set of fields (that is, is the structure of the data always the same)?
`If so, use a struct.`

    • Otherwise, if you’ve reached this point

`Use a map.`

-**Maps, keyword lists, sets and structs**

1. **Keyword lists**
    - ordered 
    - list of tuple
    - first element in tuple is always an atom

For simple access, you can use the access operator, kwlist[key]. In addition, all the functions of the Keyword and Enum modules are available.

```elixir
defmodule Canvas do
@defaults [ fg: "black", bg: "white", font: "Merriweather" ]

def draw_text(text, options \\ []) do
    options = Keyword.merge(@defaults, options)
    IO.puts "Drawing text   #{inspect(text)}"
    IO.puts "Foreground:    #{options[:fg]}"
    IO.puts "Background:    #{Keyword.get(options, :bg)}"
    IO.puts "Font:          #{Keyword.get(options, :font)}"
    IO.puts "Pattern:       #{Keyword.get(options, :pattern, "solid")}"
    IO.puts "Style:         #{inspect Keyword.get_values(options, :style)}"
    end 
end

Canvas.draw_text("hello", fg: "red", style: "italic", style: "bold")

```

2. **Maps**
    - unordered 
    - dict with key: value
    - key is whatever we wants

Maps are the go-to key/value data structure in Elixir. They have good perfor- mance at all sizes.

```elixir
map = %{ name: "Dave", likes: "Programming", where: "Dallas" }
Map.keys map
Map.values map
map[:name]
map.name
map1 = Map.drop map, [:where, :likes]
map2 = Map.put map, :also_likes, "Ruby"
Map.keys map2
Map.has_key? map1, :where
{ value, updated_map } = Map.pop map2, :also_likes
Map.equal? map, updated_map
```

**Pattern matching** 

```elixir
person = %{ name: "Dave", height: 1.88 }
%{ name: a_name } = person 
a_name
%{ name: _, height: _ } = person
%{ name: "Dave" } = person
%{ name: _, weight: _ } = person        # error
```

Now, let's use more data.
```elixir

people = [
%{ name: "Grumpy", height: 1.16},
%{ name: "Dave", height: 1.76},
%{ name: "Dopey", height: 1.96},
%{ name: "Shaquille", height: 2.16 }, 
%{ name: "Sneezy", height: 1.28 }
]

IO.inspect(for person = %{ height: height } <- people, height > 1.5, do: person)
```

```elixir
defmodule HotelRoom do
    def book(%{name: name, height: height}) 
    when height > 1.9 do
        IO.puts "Need extra-long bed for #{name}" 
    end
    def book(%{name: name, height: height}) 
    when height < 1.3 do
        IO.puts "Need low shower controls for #{name}" 
    end
    def book(person) do
        IO.puts "Need regular bed for #{person.name}"
    end 
end

people |> Enum.each(&HotelRoom.book/1)
```

We need to keep in mind that we can use pattern matching with value, but not with key

```elixir
<!-- OK -->
%{ 2 => state } = %{ 1 => :ok, 2 => :error }
state

<!-- THIS IS WRONG -->
%{ item => :ok } = %{ 1 => :ok, 2 => :error }

<!-- OK -->
data = %{ name: "Dave", state: "TX", likes: "Elixir" }
for key <- [ :name, :likes ] do
    %{ ^key => value } = data
    value
end
```
**Updating maps**

3. **Structs**

3. **Nested dictinary structures**

5. **Sets**