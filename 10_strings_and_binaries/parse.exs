defmodule Parse do
  def parse_list(list),
    do:
      if(Enum.any?(list, fn x -> x in [?+, ?-, ?*, ?/] end),
        do: _calc(~w(#{list})),
        else: raise("Operation can't be parsed or nothing in list")
      )

  defp _calc(list) do
    if Enum.at(list, 1) == "+" do
      String.to_integer(Enum.at(list, 0)) + String.to_integer(Enum.at(list, 2))
    else
      if Enum.at(list, 1) == "-" do
        String.to_integer(Enum.at(list, 0)) - String.to_integer(Enum.at(list, 2))
      else
        if Enum.at(list, 1) == "*" do
          String.to_integer(Enum.at(list, 0)) * String.to_integer(Enum.at(list, 2))
        else
          String.to_integer(Enum.at(list, 0)) / String.to_integer(Enum.at(list, 2))
        end
      end
    end
  end
end

# c "10_strings_and_binaries/parse.exs"
# Parse.parse_list('123 + 67')
# Parse.parse_list('123 - 63')
# Parse.parse_list('2 * 3')
# Parse.parse_list('12 / 6')
# Parse.parse_list('123 aaa 63')
