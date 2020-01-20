1. Write a function that returns true if a single-quoted string contains only printable ASCII characters (space through tilde).

```elixir
defmodule CheckASCII do
  def check(l), do: l in 0..255

  def check_ascii(list) do
    Enum.all?(list, &check/1)
  end
end

CheckASCII.check_ascii('abc')
CheckASCII.check_ascii('abcą')
```

2. Write an anagram?(word1, word2) that returns true if its parameters are anagrams.

```elixir
defmodule AnagramChecker do
  def check_anagram(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)
end

AnagramChecker.check_anagram('setf', 'fest')
AnagramChecker.check_anagram('setaf', 'fest')
```

3. Try the following in IEx:
`iex> [ 'cat' | 'dog' ]`
Why does IEx print 'cat' as a string, but 'dog' as individual numbers?

When we use pipe, head is just the first element of list, while tail need to be changed into list and that is why it is done explicitly.


4. (Hard) Write a function that takes a single-quoted string of the form number [+-*/] number and returns the result of the calculation. The indi- vidual numbers do not have leading plus or minus signs.
`calculate('123 + 27') # => 150`

```elixir
c "10_strings_and_binaries/parse.exs"
Parse.parse_list('123 + 67')
Parse.parse_list('123 - 63')
Parse.parse_list('2 * 3')
Parse.parse_list('12 / 6')
Parse.parse_list('123 aaa 63')
```

5. Write a function that takes a list of double-quoted strings and prints each on a separate line, centered in a column that has the width of the longest string. Make sure it works with UTF characters.
```elixir
iex> center(["cat", "zebra", "elephant"]) 
  cat
 zebra
elephant
```

```elixir
c "10_strings_and_binaries/printer.exs"
Printer.print(["cat", "zebra", "elephant"])
```


6. Write a function to capitalize the sentences in a string. Each sentence is terminated by a period and a space. Right now, the case of the characters in the string is random.
```elixir
iex> capitalize_sentences("oh. a DOG. woof. ") "Oh. A dog. Woof. "

c "10_strings_and_binaries/capitalizer.exs"
Capitalizer.capitalize_sentences("oh. a DOG. woof. ")
```

