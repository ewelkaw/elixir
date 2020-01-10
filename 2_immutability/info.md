- **Immutable data is known data**

In elixir, all values are immutable. The most complex nested list, the database record - these things behave just like the simplest integer. Their values are immutable.

Considering example below we can notice that elixir knows list1 will never change so it simply constructs a new list with a head and a tail of list1.
```elixir
list1 = [3,2,1]
list2 = [4 | list1]
``` 

Once we get familiar with the concept of immutable data, it will become much easy to use. For example, below we will not capitalize a string. Instead, we return a capitalized copy of a string.
```elixir
name = "elixir"
cap_name = String.capitalize name
name                    # "elixir"
```

- **Garbage collection**

In elixir we run programs using many processes and each process has its ow heap. The data in your application is divided up between these processes, so each individual heap is much, much smaller than would been the case if all the data had been in a single heap. As a result, garbage collection runs faster. If a process terminates before its heap becomes full, all its data is discarded - no garbage collection is required.

