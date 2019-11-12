Anonymus functions are created using the `fn` keyword. To invoke proper function we need to use dot `.`.
```elixir
fn
    parameter-list -> body
    parameter-list -> body ...
end
```

```elixir
sum = fn (a, b) -> a + b end
sum.(1,2)

greet = fn -> IO.puts "Hello" end
greet.()

f1 = fn a, b -> a * b end
f2 = fn -> 99 end
```
- **Functions and pattern matching**
```elixir
swap = fn {a, b} -> {b, a} end
swap.({6, 8})
```
- **One function, multiple bodies**
```elixir
handle_open = fn
    {:ok, file} -> "Read data: #{IO.read(file, :line)}" 
    {_, error}  -> "Error: #{:file.format_error((error))}"
    end

handle_open.(File.open("work/projects/elixir/hello.exs"))
handle_open.(File.open("work/projects/elixir/nonexists"))
```
- **Function can return function**
```elixir
fun1 = fn -> fn -> "Hello" end end
fun1.().()

fun1 =  fn ->
            fn ->
                "Hello!"
            end
        end

other = fun1.()
other.()
```

- Functions remember their original environment
```elixir
greeter = fn name -> (fn -> "Hello #{name}" end) end 
dave_greeter = greeter.("Dave")
dave_greeter.()
```
- Parameterized Functions
```elixir
add_n = fn n -> (fn other -> n + other end) end
add_two = add_n.(2)
add_five = add_n.(5)
add_two.(3)
add_five.(7)
```
- **Passing functions as arguments**
Functions arejust values, so we can pass them to other functions.
```elixir
times_2 = fn n -> n * 2 end
apply = fn (fun, value) -> fun.(value) end
apply.(times_2, 6) 

list = [1,2,3,4,5]
Enum.map list, fn elem -> elem * 2 end
Enum.map list, fn elem -> elem * elem end
Enum.map list, fn elem -> elem > 6 end
```
- Pinned values and function parameters

It means that we can use `^` operator as we used it in pattern matching, for matching function parameters. 
```elixir
defmodule Greeter do
    def for(name, greeting) do
        fn
            (^name) -> "#{greeting} #{name}"
            (_)     -> "I don't wanna know you"
        end
    end
end

mr_valim = Greeter.for("Jose", "Oi!")
IO.puts mr_valim.("Jose")
IO.puts mr_valim.("Dave")

# OR

elixir anonymous_functions/greeting.exs
```
- The `&` notation

The `&` operator converts the expression that follows into a function. Inside that expression, the placeholders &1, &2, and so on correspond to the first, second and subsequent parameters of the function.

```elixir
add_one = &(&1 + 1) # same as add_one = fn (n) -> n + 1 end
add_one.(44)

square = &(&1*&1)
square.(8)

speak = &(IO.puts(&1))
speak.("Hello")

rnd = &(Float.round(&1, &2))
# error arguments need to be in a correct order
<!-- rnd = &(Float.round(&2, &1)) --> 

div_rem = &{ div(&1, &2), rem(&1, &2)}
div_rem.(4,2)

s = &"bacon and #{&1}"
s.("custard")

match_end = &~r/.*#{&1}$/
"cat" =~ match_end.("t")
"cat" =~ match_end.("!")

len = &Enum.count/1
len.([1,2,3,4])

l = &length/1
l.([1,2,3,4])

Enum.map [1,2,3,4], &(&1 + 1)
Enum.map [1,2,3,4], &(&1 * &1)
Enum.map [1,2,3,4], &(&1 < 3)
```