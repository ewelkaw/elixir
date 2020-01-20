defmodule AnagramChecker do
  def check_anagram(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)
end

# c "10_strings_and_binaries/check_anagram.exs"
# AnagramChecker.check_anagram('setf', 'fest')
# AnagramChecker.check_anagram('setaf', 'fest')
