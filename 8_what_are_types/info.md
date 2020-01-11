The preceding two chapters described the basics of lists and maps. But you may have noticed that, although I talked about them as types, I didn’t really say what I meant.

The first thing to understand is that the primitive data types are not neces- sarily the same as the types they can represent. For example, a primitive Elixir list is just an ordered group of values. We can use the [...] literal to create a list, and the | operator to deconstruct and build lists.

Then there’s another layer. Elixir has the List module, which provides a set of functions that operate on lists. Often these functions simply use recursion and the | operator to add this extra functionality.

In my mind, there’s a difference between the primitive list and the functional- ity of the List module. The primitive list is an implementation, whereas the List module adds a layer of abstraction. Both implement types, but the type is different. Primitive lists, for example, don’t have a flatten function.

Maps are also a primitive type. And, like lists, they have an Elixir module that implements a richer, derived map type.

The code that provides the Keyword type is an Elixir module. But the type is represented as a list of tuples:
`options = [ {:width, 72}, {:style, "light"}, {:style, "print"} ]`

Clearly this is still a list, and all the list functions will work on it. But Elixir
adds functionality to give you dictionary-like behavior.

```elixir
options = [ {:width, 72}, {:style, "light"}, {:style, "print"} ]

List.last options

Keyword.get_values options, :style
```

In a way, this is a form of the duck typing that is talked about in dynamic object-oriented languages.1 The Keyword module doesn’t have an underlying primitive data type. It simply assumes that any value it works on is a list that has been structured a certain way.

This means the APIs for collections in Elixir are fairly broad. Working with a keyword list, you have access to the APIs in the primitive list type, and the List and Keyword modules. You also get Enum and Collectable, which we talk about ne

