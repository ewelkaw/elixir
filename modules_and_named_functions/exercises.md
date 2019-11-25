1. Extend the Times module with a triple function that multiples its parameter by three.

```elixir
defmodule Times do
    def double(n) do
        n * 2
    end
    def triple(n) do
        n * 3
    end
end
```

2. Run the result in IEx. Use both techniques to compile the file.

```elixir
iex> c "modules_and_named_functions/times.exs"

OR

$ iex modules_and_named_functions/times.exs

Times.triple(3)
```

3. Add a quadruple function (maybe it could call the double function ...)

```elixir
defmodule Times do
    def double(n) do
        n * 2
    end
    def triple(n) do
        n * 3
    end
    def quadruple(n) do
        Times.double(Times.double(n))
end
```

4. Implement and run a function sum(n) that uses recursion to calculate the sum of integers from 1 to n. You'll need to write this function inside a module in a separate file. Then try your function.

```elixir
defmodule Sum do
    def sum(1), do: 1
    def sum(n), do: n + sum(n-1)
end
```

```elixir
iex> c "modules_and_named_functions/sum.exs"
Sum.sum(1)
Sum.sum(3)
```

5. Write a function gcd(x,y) that finds the greatest common divisor between two non negative integers. Algebraically, gcd(x,y) is x if y is zero, gcd(y, rem(x,y)) otherwise. 

```elixir
defmodule GCD do
    def gcd(x, 0), do: x
    def gcd(0, y), do: y
    def gcd(x, y), do: gcd(y, rem(x,y)) 
end
```

```elixir
iex> c "modules_and_named_functions/gcd.exs"
GCD.gcd(0, 2)
GCD.gcd(2, 0)
GCD.gcd(4, 2) 
GCD.gcd(4, 3) 
```

6. I am thinking of a number between 1 and 1000... The most efficient way to find the number is to guess halfway between the low and high numbers of the range. If our guess is too big, then the answer lies between the bottom of the range and one less than our guess. If your guess is too small, then the answer lies between one more than our guess and the end of the range.

Your API will be guess(actual, range), where range is Elixir rang. Your output should look this: 
`Chop.guess(273, 1..1000)`

