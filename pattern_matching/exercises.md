1. Which of the following will match?
```elixir
a = [1,2,3] # ok, a = [1,2,3]
a = 4       # ok, a = 4
4 = a       # ok, 4 = 4
[a, b] = [1,2,3]    # error
a = [[1,2,3]]       # ok, a = [[1,2,3]]
[a] = [[1,2,3]]     # ok, a = [1,2,3]
[[a]] = [[1,2,3]]   # error
```
2. Which of the following will match?
```elixir
[a,b,a] = [1,2,3]   # error, because `a` can not be equal to 1 and 3 
[a,b,a] = [1,1,2]   # error, because `a` can not be equal to 1 and 2
[a,b,a] = [1,2,1]   # ok
```
3. The variable `a` is bound to the value 2. Which of the following  will match?
```elixir
[a,b,a] = [1,2,3]   # error, because `a` can not be equal to 1 and 3 
[a,b,a] = [1,1,2]   # error, because `a` can not be equal to 1 and 2 
a = 1               # ok
^a = 2              # error, `a` is equal to 1 
^a = 1              # ok
^a = 2 - a          # ok
```