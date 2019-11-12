1. Go into IEx. Create and run the functions that do the following.
    - list_concat([:a, :b], [:c, :d]) #-> [:a, :b, :c, :d]
    ```elixir
    list_concat = fn ([a,b], [c,d]) -> [a, b, c, d] end

    list_concat.([1,2], [3,4]) 
    ```
    - sum.(1,2,3) #-> 6
    ```elixir
    sum = fn (a, b, c) -> a + b + c end

    sum.(1,2,3)
    ```
    - pair_tuple_to_list({1234,5678}) #-> [1234,5678]
    ```elixir
    pair_tuple_to_list = fn ({a, b}) -> [a, b] end

    pair_tuple_to_list.({1234,5678})  
    ```
    2. Write a function that takes three arguments. If the first two are zero, return "FizzBuzz", if the first is zero then "Fizz". If the second is zero, return "Buzz". Otherwise, return the third argument.
```elixir
check_args = fn 
    0, 0, _   -> "FizzBuzz"
    0, _, _   -> "Fizz"  
    _, 0, _   -> "Buzz"
    _, _, n   -> n
end

IO.puts check_args.(0,0,1)
IO.puts check_args.(0,2,1)
IO.puts check_args.(1,0,1)
IO.puts check_args.(1,3,1)

# OR 

elixir anonymous_function/check_args.exs
```
3. The operator rem(a,b) returns the reminder after dividing a by b. Write a function that takes a single integer(n) and calls the function in the previous exercise, passing it rem(n,3), rem(n,5) and n. Call it seven times with the arguments 10,11,12 and so on. You should get "Buzz, 11, Fizz, 13, 14, FizzBuzz, 16"
```elixir
rem_int = fn
        n -> check_args.(rem(n,3), rem(n,5), rem(n,n))
    end

IO.puts rem_int.(10)
IO.puts rem_int.(11)
IO.puts rem_int.(12)

# OR 

elixir anonymous_function/rem_int.exs 
```
4. Write a function prefix that takes a string. It shoud return a new function that takes a second string. When that second function is called, it will return a string containing the first string, the space anf the second string
```elixir
concat_with_space = fn first -> ( fn second -> "#{first} #{second}" end) end
concat_with_space.("Mrs").("John")
elx = concat_with_space.("Elixir")
elx.("Rocks")
```
5. Use the `&` notation to rewrite the following:
    - Enum.map [1,2,3,4], fn x -> x + 2 end
    ```elixir
    list = [1, 2, 3, 4, 5]
    new_map = Enum.map list, &(&1 + 2)
    ```
    - Enum.map [1,2,3,4], fn x -> IO.inspect x end
    ```elixir
    list = [1, 2, 3, 4, 5]
    new_map = Enum.map list, &(IO.inspect &1)
    ```
