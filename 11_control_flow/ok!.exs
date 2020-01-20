defmodule Ok do
  def ok!(param) do
    case param do
      {:ok, data} ->
        data

      tuple ->
        raise "ERROR for parameter #{elem(tuple, 1)}"
    end
  end
end

# c("11_control_flow/ok!.exs")
# file = Ok.ok! File.open("somefile")
# file = Ok.ok!({:ok, "data"})
