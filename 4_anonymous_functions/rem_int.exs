# The operator rem(a,b) returns the reminder after dividing a by b. Write a function that takes a single integer(n) and calls the function in the previous exercise, passing it rem(n,3), rem(n,5) and n. Call it seven times with the arguments 10,11,12 and so on. You should get "Buzz, 11, Fizz, 13, 14, FizzBuzz, 16"

check_args = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

rem_int = fn
  n -> check_args.(rem(n, 3), rem(n, 5), rem(n, n))
end

IO.puts(rem_int.(10))
IO.puts(rem_int.(11))
IO.puts(rem_int.(12))
