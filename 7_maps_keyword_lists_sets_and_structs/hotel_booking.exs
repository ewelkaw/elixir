defmodule HotelRoom do
    def book(%{name: name, height: height}) 
    when height > 1.9 do
        IO.puts "Need extra-long bed for #{name}" 
    end
    def book(%{name: name, height: height}) 
    when height < 1.3 do
        IO.puts "Need low shower controls for #{name}" 
    end
    def book(person) do
        IO.puts "Need regular bed for #{person.name}"
    end 
end

people = [
%{ name: "Grumpy", height: 1.16},
%{ name: "Dave", height: 1.76},
%{ name: "Dopey", height: 1.96},
%{ name: "Shaquille", height: 2.16 }, 
%{ name: "Sneezy", height: 1.28 }
]

people |> Enum.each(&HotelRoom.book/1)
# c "7_maps_keyword_lists_sets_and_structs/hotel_booking.exs"