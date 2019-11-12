- **Value types**
    - Integers (decimal - 1_000, hexadecimal - 0xcafe, octal - 0o765, binary - 0b1010)
    - Floating-point numbers (1.0, 0.2456, 0.314159e1, 314159.0e-5)
    - Atoms (constants that represent something's name, which name is their values `:fred`,`:var@2`)
    - Ranges (represents atar..end, where start and end are integers)
    - Regular expressions (
        
        Regex.run  ~r{[aeiou]}, "catepillar" -> ["a"]

        Regex.scan  ~r{[aeiou]}, "catepillar" -> [["a"], ["e"], ["i"], ["a"]]

        Regex.split  ~r{[aeiou]}, "catepillar" -> ["c", "t", "rp", "ll", "r"]

        Regex.replace  ~r{[aeiou]}, "catepillar", "*" -> "c*t*rp*ll*r"
- **System types**

    - PIDs and ports 

        A PID is a reference to a local or remote process and a port is a reference to a resource. The PID of the current process is avaliable by calling `self`. 
    - References

        The function `make_ref` creates a globally unique reference; no other reference will be equal to it.

- **Collection types**
    - tuple - ordered collection of values
```elixir
{1,2}
{:ok, 42, "next"}
{:error, :enoent}
# pattern matching
{status, count, action} = {:ok, 42, "next"}
```
    - list - linked data structure
```elixir
[1,2,3] ++ [4,5,6]  # concatenation
[1,2,3,4] -- [2,4]  # difference
1 in [1,2,3,4]      # membership
"wombat" in [1, 2, 3, 4]
```
    - keywords list
```elixir
[name: "Dave", city: "Dallas", likes: "Programming"]
[1, fred: 1, dave: 2]
```
- **Maps**

Map is a collection of key/value pairs.
    
```elixir
%{key -> value, key -> value}
states = %{"AL" -> "Alabama", "WI" -> "Wisconsin"}
%{"one" -> 1, :two -> 2, {1,1,1} -> 2}
```
Accessing maps
```elixir
states = %{"AL" -> "Alabama", "WI" -> "Wisconsin"}
states["AL"]
states["TX"]
colors = %{red: 0xff0000, green: 0x00ff00, blue: 0x0000ff}
colors[:red]
colors[:grey]
```
- **Binaries**
If we need to access data as a sequence of bits and bytes (headers of JPEG or MP3 files) then we should use `<< and >>`
```elixir
bin = <<1,2>>
byte_size bin
bin2 = <<3 :: size(2), 5 :: size(4), 1 :: size(2)>>
byte_size bin2
```
- **Dates and times**
Elixir has a calendar module and four new date and time related types, which represents the rules used to manipulate dates.
```elixir
# date
d1 = Date.new(2018, 12, 25)
d2 = ~D[2018-12-30]
d1 == d2
Date.day_of_the_week(d1)
Date.add(d1, 7)
inspect d1
date_range = Date.range(d1, d2)
Enum.count(date_range)
~D[2018-12-27] in date_range

# time
{:ok, t1} = Time.new(12, 34, 56)
t2 = ~T[16:34:56]
t3 = Time.add(t1, 3600)
t4 = Time.add(t1, 3600, :milisecond)
```
- **Names, source files, convensions, operators and so on**

Elixir identifiers must start with a letter or underscore, optionally followed by letters, digits and underscores.
```elixir
name
jose
_age
_42
```
- Truth
```elixir
:true  == true
:false == false
nil # treated as false in boolean context
```
- Operators
```elixir
a === b # strict equality (so 1 === 1.0 is false)
a !== b # strict inequality (so 1 !== 1.0 is true)
a == b  # value equality
a != b  # value inequality
a > b   # comparison
a >= b  # comparison
a < b   # comparison
a <= b  # comparison
```
`number < atom < reference < function < port < pid <tuple < map < list < binary`
- Boolean opertors 
```elixir
a or b ; a || b     # true if a is true; otherwise b
a and b ; a && b    # false if a is false; otherwise b
not a ; !a      # false if a is true; otherwise true
```
- Arithmetic operators
```elixir
+ - * / div rem (remindr operator)
```
- Join operators
```elixir
binary1 <> binary2  # concatenates two binaries
list ++ list2       # concatenates two lists
list -- list2       # removes elements of list2 from list1 
```
- The in operator
```elixir
a in enum           # tests if a is included in enum
```
- **Variable scope**
- Do-block scope

It is risky, because of variables initialization
```elixir
line_no = 50
...
if (line_no == 50) do
    IO.puts "new_page\f"
    line_no = 0
end
IO.puts line_no
```
- The with expression

It allowes to define a local scope for variables
```elixir
content = "Now is the time"
lp = with {:ok, file}   = File.open("/etc/password"),
        content         = IO.read(file, :all), 
        :ok             = File.close(file),
        [_, uid, gid]   = Regex.run(~r/^lp:.*?:(\d+):(\d+)/m, content)
    do
        "Group: #{grid}, User: #{uid}"
    end
```
```elixir
mean =  with count = Enum.count(values),
            sum = Enum.sum(values)
        do 
            sum/count
        end

# OR

mean =  with 
            (count = Enum.count(values),
            sum = Enum.sum(values)
        do 
            sum/count
        end)

# OR 

mean =  with    count = Enum.count(values),
                sum = Enum.sum(values)
        do 
            sum/count
```
