1. Write a mapsum function that takes a list and a function. It applies the function to each element of the list and then sums the result, so
`iex> MyList.mapsum [1, 2, 3], &(&1 * &1) 14`

```elixir
defmodule MyList do
    def mapsum([], _func),          do: 0
    def mapsum([head|tail], func),  do: func.(head) + mapsum(tail, func)
end
```

2. Write a max(list) that returns the element with the maximum value in the list. (This is slightly trickier than it sounds.)
`maxval.exs`

```elixir
defmodule MyList do
    def maxval([]),                 do: nil
    def maxval([head|tail]),        do: compare(head, maxval(tail))

    defp compare(nil, b),           do: b
    defp compare(a, nil),           do: a
    defp compare(a, b) when a > b,  do: a 
    defp compare(a, b) when a <= b, do: b
end
```

3. An Elixir single-quoted string is actually a list of individual character codes. Write a caesar(list, n) function that adds n to each list element, wrapping if the addition results in a character greater than z.
`iex> MyList.caesar('ryvkve', 13) ?????? :)`

```elixir
defmodule CaesarList do 
    def caesar([], _val),               do: []
    def caesar([head|tail], val),       do: [run_caesar(head, val)]++ caesar(tail, val)

    def run_caesar(n, val),             do: if div(val,97) > 0, do: n + (val - div(val,97)*97), else: n + val
    
end
```

4. Write a function MyList.span(from, to) that returns a list of the numbers from from up to to.
```elixir
defmodule MyList do
    def span(n, m) when n == m, do: [n]
    def span(n, m) when n < m, do: [n] ++ span(n+1, m)
    def span(n, m) when n > m, do: []
end
```