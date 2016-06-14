class Home
	attr_reader(:name, :city, :capacity, :price)

	def initialize(name, city, capacity, price)
		@name = name
		@city = city
		@capacity = capacity
		@price = price
	end
end



# homes = [
#   Home.new("Nizar's place", "San Juan", 2, 42),
#   Home.new("Fernando's place", "Seville", 5, 47),
#   Home.new("Josh's place", "Pittsburgh", 3, 41),
#   Home.new("Gonzalo's place", "Málaga", 2, 45),
#   Home.new("Ariel's place", "San Juan", 4, 49)
# ]

# # LOOP EXAMPLE

# for home in homes do
# 	puts home.name
# end
# homes.each { |home| puts "#{home.name} in #{home.city}\nPrice: #{home.price} a night"  }

# # MAP EXAMPLE

# home_prices = homes.map { |home| home.price }
# reduced_home = home_prices.reduce(0) {|sum, x| sum + x}

# puts reduced_home.to_f / homes.length

# total_capacity = 0.0

# # CHANGE TO REDUCE

# home_price_reduce = homes.reduce(0.0) do |sum, home|
# 	sum + home.price
# end
# home_price_averaged = home_price_reduce / homes.length
# puts "This is the reduced average price of homes #{home_price_averaged}"

# # EACH EXAMPLE

# homes.each do |hm|
# 	total_capacity = total_capacity + hm.capacity
# end

# average_capacity = total_capacity / homes.length

# puts "The average capacity is: #{average_capacity}"

# # REDUCE EXAMPLE
# new_total_capacity = homes.reduce(0.0) do |sum, hm|
# 	sum + hm.capacity
# end

# puts new_total_capacity

# new_average_capacity = new_total_capacity / homes.length

# puts "The average capacity is: #{new_average_capacity}"

# # EACH WITH INDEX EXAMPLE

# homes.each_with_index do |home, index|
# 	puts "#{index + 1}. #{home.name}"
# end

# # SELECT EXAMPLE

# san_juan_homes = homes.select do |home|
# 	home.city == "San Juan"
# end

# low_capacity_homes = homes.select do |homes|
# 	homes.capacity <= 3
# end

# # FIND EXAMPLE

# home_41_dollars = homes.find do |home|
# 	home.price == 41
# end

# puts "The first home I found with a price of 41 dollars is #{home_41_dollars.name}"

# # SORT EXAMPLE

# sorted_homes = homes.sort do |home_one, home_two|
# 	home_one.capacity <=> home_two.capacity
# end

# # RANGE EXAMPLE

# range = 1..50

# range.each do |number|
# 	puts "This number is #{number}"
# end

# mapped_range = range.map do |number| 
# 	number * 2
# end

# # HASH EXAMPLE

# hellos = {

# 	english: "Hello",
# 	spanish: "Hola",
# 	french: "Bonjour"
# }

# hellos.each do |language, word|
# 	puts "The word for Hello in #{language} is: #{word}"
# end

# EXERCISE
def looped_function()
	homes_exc = [
		Home.new("Jake's Place", "Price", 4, 98),
		Home.new("Soy's Place", "Tokyo", 3, 97),
		Home.new("Steven's Place", "London", 6, 75),
		Home.new("Jeb's Place", "Tooele", 3, 198),
		Home.new("Shaney's Place", "Hurricane", 9, 498),
		Home.new("Zake's Place", "Amarillo", 10, 99),
		Home.new("Loy's Place", "Aurora", 5, 75),
		Home.new("Veven's Place", "Helena", 6, 345),
		Home.new("Deb's Place", "Fort Lauderdale", 2, 258),
		Home.new("Shane's Place", "Barcelona", 6, 50)
	]

	sorted_homes = homes_exc.sort do |home_one, home_two|
		home_one.price <=>  home_two.price
	end

	puts "Welcome to textBnB! Here are a few homes below.."
	puts ""
	sorted_homes.each do |home| 
		puts "#{home.name} $#{home.price}" 
	end
	puts ""

	puts "Enter Number To View Option:\n[1] Sort By Price High [2] Sort By Home Capacity [3] Search by City [4] Search by Price"

	input = gets.chomp.to_i

	if input == 1 
		sorted_homes = homes_exc.sort do |home_one, home_two|
			home_two.price <=>  home_one.price
		end

		sorted_homes.each { |home| puts "#{home.name} $#{home.price}" }
		puts ""
	elsif input == 2
		sorted_homes = homes_exc.sort do |home_one, home_two|
			home_two.capacity <=>  home_one.capacity
		end

		sorted_homes.each { |home| puts "#{home.name} #{home.capacity} people" }
		puts ""
	elsif input == 3

		puts "Enter a city name to view available homes"
		select_input = gets.chomp

		selected_homes_from_input = homes_exc.select do |home|
			home.city.downcase == select_input.downcase
		end

		selected_homes_from_input.each do |home|
			puts "#{home.name} is in #{home.city}"
		end

		sum_price = selected_homes_from_input.reduce(0.0) do |sum, home|
			sum + home.price
		end

		avg_price = sum_price / selected_homes_from_input.length

		puts "The average price of shown homes is #{avg_price}"

		puts ""
	elsif input == 4
		puts "Name your price! Enter an integer amount: "

		int_input = gets.chomp.to_i

		priced_home = homes_exc.find do |home|
			home.price == int_input
		end

		if priced_home != nil 
			puts "#{priced_home.name} is $#{int_input}"
		else 
			puts "Sorry no homes with that price!"
		end
		puts ""
	else 
		puts "unrecognized input"

		puts "Would you like to view your options again? (Y/N)"
		last_input = gets.chomp

		if last_input == "Y" || last_input == "y"
			looped_function
		end
		puts ""
	end
	puts "Would you like to view your options again? (Y/N)"
	last_input = gets.chomp

	if last_input == "Y" || last_input == "y"
		looped_function
	end
end

looped_function













