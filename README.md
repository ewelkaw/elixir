# elixir
Introduction to programming in Elixir.

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

Example script is in: `intro/hello.exs`
```bash
elixir intro/hello.exs
```
