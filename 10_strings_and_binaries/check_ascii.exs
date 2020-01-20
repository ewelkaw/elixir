defmodule CheckASCII do
  def check(l), do: l in 0..255

  def check_ascii(list) do
    Enum.all?(list, &check/1)
  end
end

# c "10_strings_and_binaries/check_ascii.exs"
# CheckASCII.check_ascii('abc')
# CheckASCII.check_ascii('abcą')
