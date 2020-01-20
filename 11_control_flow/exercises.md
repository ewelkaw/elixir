1. Rewrite the FizzBuzz example using case.

```elixir
c("11_control_flow/case_fuzz_buzz.exs")
FizzBuzz.upto(20)
```

2. Many built-in functions have two forms. The xxx form returns the tuple {:ok, data} and the xxx! form returns data on success but raises an exception otherwise. However, some functions don’t have the xxx! form.
Write an ok! function that takes an arbitrary parameter. If the parameter is the tuple {:ok, data}, return the data. Otherwise, raise an exception containing information from the parameter.
You could use your function like this:
```elixir
file = ok! File.open("somefile")
```

```elixir
c("11_control_flow/ok!.exs")
file = Ok.ok! File.open("somefile")
file = Ok.ok!({:ok, "data"})
```