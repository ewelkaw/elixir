Once the program grows beyond a couple of lines, we would like to structure it, break it into named functions and organized this funtions into modules. Elixir named functions must be written inside modules.

In file `modules_and_named_functions/times.exs`, there is a module named Times, which contains a single function double.
To compile this module we need to write in terminal:

```elixir
$ iex times.exs
iex> Times.double(4)
```

OR we can compilr the file by using:

```elixir
iex> c "times.exs"
iex> Times.double(4)
```

**Exceptions:**

`iex> Times.double('cat')`
```elixir
** (ArithmeticError) bad argument in arithmetic expression: 'cat' * 2
    :erlang.*('cat', 2)
    modules_and_named_functions/times.exs:3: Times.double/1
```
We should notice that `Times.double/1` means there is one parameter expected.

When we have function with two parameters we can use it from: `modules_and_named_functions/greet_someone.exs`

In terminal: 
```elixir
$ iex greet_someone.exs
iex> Greeting.greet("Hello", "Anna")
```
- **Function calls and pattern matching**
Same as with anonymous functions we can use pattern matching here. The difference is that we write the function multiple times, each time with its own parameter list and body. Although this looks like multiple function definitions, purists will tell you it's multiple clauses of the same definition.

In `modules_and_named_functions/factorial.exs` we have two definitions of the same function. 
We can try it using code from below.

```elixir
iex> c "modules_and_named_functions/factorial.exs"
Factorial.of(0)
Factorial.of(3)
```
Pattern matching is common for almost every functional languages. To make it in a proper way we should use this two steps:
1. Look for the simplest possible case, one that has a definite answer (the anchor case).
2. Look for recursive solution that will end up calling the anchor case.

You should also remember about the order of definitions.

- **Guard clauses**
This kind of clauses will help us distinguish based on the argument types or on some test involving their values. Guard clauses are predicates that are attached to a function definition using one or more when keywords.

```elixir
$ iex modules_and_named_functions/guard.exs

Guard.what_is(8)
Guard.what_is(:cat)
Guard.what_is([1,2,3])
```

We can also fix our factorial function to be robust for negative values or non-numbers. 

```elixir
defmodule Factorial do
    def of(0), do: 1
    def of(n) when is_integer(n) and n >0 do 
        n* of(n-1)
    end
end
```

```elixir
iex> c "modules_and_named_functions/factorial_fixed.exs"
Factorial.of(0)
Factorial.of(3)
Factorial.of(-3)
```

- **Guard clause limitations**

**Comparison operators:**
`==, !=, ===, !==, >, <, <=, >=`

**Boolean and negation operators:**
`or, and, not, !` 
Note that `||` and `&&` are not allowed.

**Arithmetic operators:**
`+, -, *, /`

**Join operators:**
`<> and ++, as long as the left side is a literal`

**The `in` operator:**
Membership in a collection or range.

**Type-check functions:**
These build-in Erlang functions return true if their argument is a given type. You can find their documentation online. 

is_atom     is_binary   is_bitstring    is_boolean  is_exception    is_float
is_function is_integer  is_list         is_map      is_number       is_pid
is_port     is_record   is_reference    is_tuple

**Other functions:**
These build-in functions return values (not true or false). Their documentation is online, on the same page as the type-check functions.

abs(number)     bit_size(bitstring)     byte_size(bitstring)    div(number, number)
elem(tuple, n)  float(term)             hd(list)                length(list)
node()          node(pid|ref|port)      rem(number, number)     round(number)
self()          tl(list)                trunc(number)           tuple_size(tuple)

- **Default parameters**
When you define a function, you can give a default value to any of its parameters by using the syntax `param \\ value`. When you call a function that is defined with default parameters, Elixir compares the number of arguments you are passing with the numbers of required parameters for the function. If you're passing fewer arguments than the number of required parameters then there is no match. If the two numbers are equal, then the required parameters take the values of the passed arguments, and the other parameters take their default values. If the count of passed arguments is greater than the number of required parameters, Elixir uses the excess to override the default values of some or all parameters. Parameters are matched left to right. 

```elixir
defmodule Example do
    def func(p1, p2 \\ 2, p3 \\ 3, p4) do
        IO.inspect [p1, p2, p3, p4]
    end
end
```

```elixir
iex> c "modules_and_named_functions/example.exs"

Example.func("a", "b")
Example.func("a", "b", "c")
Example.func("a", "b", "c", "d")
```

With different functionns definition:
```elixir
defmodule Params do
    def func(p1, p2 \\ 123) 

    def func(p1, p2) when is_list(p1) do
        "You said #{p2} with a list"
    end

    def func(p1, p2) do
        "You passed in #{p1} and #{p2}"
    end
end
```

```elixir
iex> c "modules_and_named_functions/params.exs"

Params.func(99)
<!-- "You passed in 99 and 123" -->

Params.func(99, "cat")    
<!-- "You passed in 99 and cat" -->

Params.func([99])
<!-- "You said 123 with a list" -->

Params.func([99], "dog")
<!-- "You said dog with a list" -->
```
