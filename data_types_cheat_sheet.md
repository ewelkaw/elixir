**First of all:** https://devhints.io/elixir

1. ***Tuple:***
    - ordered 
    - {:ok, 42, "next"}

**Accessing:** elem

2. ***List:***
   -  linked data structure
   - ordered
   - any kind of elements
   - elements can be different type
   - [:ok, 1,"user"]

3. ***Atoms:***
   - constants that represent something's name, which name is their values 
   - :fred,  :var@2

4. ***Keyword list:***
    - ordered 
    - list of tuple
    - first element in tuple is always an atom
    - [key_atom : value]
**Accessing:**  At, all, Access.pop

5. ***Map:*** 
    - unordered 
    - dict with key: value
    - key is whatever we wants
    - %{key: value}
**Accessing:** `key` and `key!`, Access.pop

6. ***Struct:***
    - fixed set of fields with default values for those fields 
    - dict with key: value
    - key need to be an atom
    - %{key_atom: value}
**Accessing:** `key` and `key!`

7. ***Set:***
    - logarithmic time complexity
    - any kind of elements
    - elements can be different type
    - can't contain duplicate elements
    - unordered
