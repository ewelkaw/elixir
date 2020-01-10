defmodule MyList do
    def span(n, m) when n == m, do: [n]
    def span(n, m) when n < m, do: [n] ++ span(n+1, m)
    def span(n, m) when n > m, do: []
end

# c "lists_and_recursion/range.exs"
# MyList.span(3,1)
# MyList.span(1,3)
# MyList.span(1,1)