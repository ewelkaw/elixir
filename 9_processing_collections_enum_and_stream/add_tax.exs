defmodule AddTax do
  def check_tax(x, y),
    do:
      if(Enum.at(x, 0) in Keyword.keys(y),
        do: Enum.at(x, 1) + Enum.at(x, 1) * Keyword.get(y, Enum.at(x, 0)),
        else: Enum.at(x, 1)
      )
end

defmodule TestTax do
  def tax_rates, do: [NC: 0.075, TX: 0.08]

  def orders,
    do: [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.50],
      [id: 125, ship_to: :TX, net_amount: 24.00],
      [id: 126, ship_to: :TX, net_amount: 44.80],
      [id: 127, ship_to: :NC, net_amount: 25.00],
      [id: 128, ship_to: :MA, net_amount: 10.00],
      [id: 129, ship_to: :CA, net_amount: 102.00],
      [id: 130, ship_to: :NC, net_amount: 50.00]
    ]

  def result,
    do:
      for(
        x <- orders(),
        do: Keyword.put(x, :tax, AddTax.check_tax([x[:ship_to], x[:net_amount]], tax_rates()))
      )
end

# c "9_processing_collections_enum_and_stream/add_tax.exs"
