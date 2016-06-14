fruits = [
	"orange", 
	"banana", 
	"peach"
]

fruits.each do |single_fruit|
	puts single_fruit
end

classmates = ["Jack", "Wally", "Joey"]

classmates.each do |classmate|
	puts "Hello #{classmate}"
end

for classmate in classmates do
	puts classmate
end

input = [1, 2, 3]

output = input.map do |item|
	return item + 1
end

puts output

total = []

[1, 2, 3].each do |item|
	total.push(item + 1)
end
puts total

cities = ["miami", "madrid", "barcelona"]

capitalized_cities = cities.map { |city| city.capitalize }

puts cities
puts capitalized_cities

puts capitalized_cities.reduce {|string, city| string + " " + city}

total_length = cities.reduce(0) do |sum, city|
	sum + city.length
end

puts total_length / cities.length



def sieve(array)
	if array.length == 0
		return []
	end
	new_array = []

	array.map { |e| 
		if (e % array[0]) != 0 
		new_array.push(e)
		end
		}
	
	[array[0]] + sieve(new_array)
end


puts sieve([2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])