defmodule Capitalizer do
  def capitalize_sentences(""), do: ""

  def capitalize_sentences(str) do
    Enum.join(capitalize_elements(divide_sentences(str)), ". ")
  end

  def divide_sentences(str) do
    String.split(String.downcase(str), ". ", trim: true)
  end

  def capitalize_elements(list) do
    for x <- list, do: String.capitalize(x)
  end
end

# c "10_strings_and_binaries/capitalizer.exs"
# Capitalizer.capitalize_sentences("oh. a DOG. woof. ")
