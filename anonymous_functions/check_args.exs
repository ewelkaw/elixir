# Write a function that takes three arguments. If the first two are zero, return "FizzBuzz", if the first is zero then "Fizz". If the second is zero, return "Buzz". Otherwise, return the third argument.

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
