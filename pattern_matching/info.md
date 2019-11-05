- **Matches**

`=` is the match operator so it does not mean assigment, but acts more like assertion. So elixir try to find a way of making the left-hand side equal to the right-hand side.
```elixir
a = 1
a + 3
```
```elixir
a = 1
1 = a
2 = a  # will give an error, because `a` is equal to 1
a = 2
```

- **More compex matches**
    - elixir lists:
    ```elixir
    ["a", "b", ["c", "d"]]

    list = [1,2,3]
    [a, b, c] = list
    a   # will print 1
    b   # will print 2
    c   # will print 3
    ```
    This is possible because of `pattern matching`

    ```elixir
    list = [1,2,[3,4,5]]
    [a, b, c] = list
    a   # will print 1
    b   # will print 2
    c   # will print [3,4,5]

    list = [1,2,3]
    [a, 2, b] = list
    a   # will print 1
    b   # will print 3

    # this will not work
    list = [1,2,3]
    [a, 1, b] = list
    ```
- **Ignoring a value with _ (underscore)**

If we didn't want to capture a value during the match, we could use the special variable `_` (an underscore). This acts like a variable but immediately discards any value given to it in a pattern match. It is like a wilcard saying "I'll accept any value here"
```elixir
[1, _, _] = [1, 2, 3]
[1, _, _] = [1, "cat", "dog"]
```
- **Variables bling once (per match)**

Once a variable has been bound to a value in the matching process, it keeps that value for the remainder of the match. 
```elixir
[a, a] = [1, 1]
[b, b] = [1, 2]
```
Also, there is a possibility to force elixir to use the existing value of the variable in the pattern when we prefix it with `^` - the `pin operator`.

```elixir
a = 1
a = 2
^a = 1  # error, because a is equal to 2 and 2 != 1

[1, ^a, 3] = [1, 2, 3]
[^a, 2] = [1, 2]    # error, because a is equal to 2 and 2 != 1
```
### Exercises to this part are in: `pattern_matching/exercises.md`