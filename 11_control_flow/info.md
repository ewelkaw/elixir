Elixir code tries to be declarative, not imperative.

1. **if and unless**

In Elixir, if and its evil twin, unless, take two parameters: a condition and a keyword list, which can contain the keys do: and else:. If the condition is truthy, the if expression evaluates the code associated with the do: key; otherwise it evaluates the else: code. The else: branch may be absent.

```elixir
if 1 == 1, do: "true part", else: "false part"
if 1 == 2, do: "true part", else: "false part"
```

Just as it does with function definitions, Elixir provides some syntactic sugar. You can write the first of the previous examples as follows:

```elixir
if 1 == 1 do 
    "true part" 
else
    "false part" 
end
```

unless is similar:

```elixir
unless 1 == 1, do: "error", else: "OK"
unless 1 == 2, do: "OK", else: "error"


unless 1 == 2 do 
    "OK"
else
    "error"
end
```
2. **cond**

The cond macro lets you list out a series of conditions, each with associated code. It executes the code corresponding to the first truthy conditions.
In the game of FizzBuzz, children count up from 1. If the number is a multiple of three, they say “Fizz.” For multiples of five, they say “Buzz.” For multiples of both, they say “FizzBuzz.” Otherwise, they say the number.

```elixir
defmodule FizzBuzz do
  def upto(n) when n > 0, do: _upto(1, n, [])
  
  defp _upto(_current, 0, result), do: Enum.reverse result
  
  defp _upto(current, left, result) do 
    next_answer =
      cond do
        rem(current, 3) == 0 and rem(current, 5) == 0 ->
          "FizzBuzz"
        rem(current, 3) == 0 ->
          "Fizz"
        rem(current, 5) == 0 ->
          "Buzz"
        true ->
          current
      end
    _upto(current+1, left-1, [ next_answer | result ])
  end 
end

FizzBuzz.upto(20)
```
3. **case**

case lets you test a value against a set of patterns, executes the code associated with the first pattern that matches, and returns the value of that code. The patterns may include guard clauses.
For example, the File.open function returns a two-element tuple. If the open is successful, it returns {:ok, file}, where file is an identifier for the open file. If the open fails, it returns {:error, reason}. We can use case to take the appropriate action when we open a file. (Here, the code opens its own source file.)

```elixir

defmodule Users do
    dave = %{ name: "Dave", state: "TX", likes: "programming" } 
    case dave do
        %{state: some_state} = person ->
        IO.puts "#{person.name} lives in #{some_state}"
        _ ->
        IO.puts "No matches"
    end 
end

dave = %{name: "Dave", age: 27} 
case dave do
    person = %{age: age} when is_number(age) and age >= 21 -> 
        IO.puts "You are cleared to enter the Foo Bar, #{person.name}"
    _ ->
    IO.puts "Sorry, no admission"
end
```
4. **Raising Exceptions**

Exceptions in Elixir are not control-flow structures.
Elixir exceptions are intended for things that should never happen in normal operation. That means the database going down or a name server failing to respond could be considered exceptional. Failing to open a configu- ration file whose name is fixed could be seen as exceptional. However, failing to open a file whose name a user entered is not.

```elixir
raise "Giving up"
raise RuntimeError
raise RuntimeError, message: "override message"
```
5. **Designing with Exceptions**


If File.open succeeds, it returns {:ok, file}, where file is the service that gives you access to the file. If it fails, it returns {:error, reason}. So, for code that knows a file open might not succeed and wants to handle the fact, you might write:

```elixir
case File.open(user_file_name) do 
    {:ok, file} ->
        process(file) 
    {:error, message} ->
        IO.puts :stderr, "Couldn't open #{user_file_name}: #{message}" 
end
```

If instead you expect the file to open successfully every time, you could raise an exception on failure.

```elixir
case File.open("config_file") do 
    {:ok, file} ->
        process(file) 
    {:error, message} ->
        raise "Failed to open config file: #{message}" end
```
Or you could let Elixir raise an exception for you and write:

```elixir
{ :ok, file } = File.open("config_file") 
process(file)
```

If the pattern match on the first line fails, Elixir will raise a MatchError exception.

```elixir
file = File.open!("config_file")
```