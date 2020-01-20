# elixir
Introduction to programming in Elixir.

Based on book: `Programming Elixir >= 1.6` by `Dave Thomas`

### 1. INSTALLING
https://elixir-lang.org/install.html
```bash
brew update
brew install elixir
```
### 2. INTERACTIVE ELIXIR
```bash
$ iex
```
To exit: `Ctrl+C`

- writing string to the console:
```elixir
IO.puts "Hello world!"
```
- getting infoabout value:
```elixir
i 123
i "cat"
i %{name: "Dave", likes: "Elixir"}
i Map
```
### 3. SCRIPTS
Typically, elixir scripts have extension `.ex` (intend to be compiled into binary form) or `.exs` (can be run without compiling).

Example script is in: `hello.exs`
```bash
elixir hello.exs
```

### 4. ELIXIR CHEAT SHEET
https://devhints.io/elixir


### 5. Display char lists correctly FFS
```
IEx.configure inspect: [charlists: false
```

### AGENDA
--- Conventional programming ---

    1. Pattern matching
    2. Immutability
    3. Elixir basics
    4. Anonymous functions
    5. Modules and named functions
    6. Lists and recursion
    7. Maps, keyword lists, sets and structs
    8. What Are Types?
    9. Processing Collections — Enum and Stream
    10. Strings and binaries
    11. Control flow
    12. Organizing a project
    13. Tooling

--- Concurent programming ---

