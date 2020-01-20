defmodule Printer do
  def print([]), do: ""

  def print(list) do
    for x <- list,
        do:
          _print_element(
            _prepare_element(
              String.split(x, "", trim: true),
              div(_check_max(list) - String.length(x), 2)
            )
          )
  end

  defp _check_max(list) do
    String.length(Enum.max_by(list, &String.length/1))
  end

  defp _prepare_element(element_list, 0), do: element_list
  defp _prepare_element(element_list, n_add), do: [" " | prepare_element(element_list, n_add - 1)]

  defp _print_element(list) do
    IO.puts(List.to_string(list))
  end
end

# c "10_strings_and_binaries/printer.exs"
# Printer.print(["cat", "zebra", "elephant"])
