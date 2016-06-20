hi = {:wat => ["no", 1, {:wut => ["", [[1,2,3,4,5,6,7,8,9,{:bbq => "Hi!"}]]]}]}

new_hash = {:wat => [0, 1, {:wut => [0,[[0,1,2,3,4,5,6,7,8,{:bbq => "Hi"}]]]}]}

puts new_hash[:wat][2][:wut][1][0][9][:bbq]
puts hi[:wat][2] [:wut] [1] [0] [9][:bbq]


hash_easy = {:wat => [0,1,{:wut => [0, [[0,1,2,3,4,5,6,7,8,{:bbq => "Hi"}]]]}]}


class CarDealer 

	def initialize(inventory)
		@inventory = inventory
	end

	def cars
		puts "What kind of car are you looking for?"
		car_type = gets.chomp.to_sym
		puts @inventory
		reduced_string = @inventory[car_type].reduce("") do |concat_str, next_str|
			concat_str + " #{next_str},"
		end

		puts "#{car_type}: #{reduced_string}"
	end

	def output_car_string


		#Format car string
		
	end

end

cars_array = 
{
	:Toyota => ["Tacoma"],
	 :Peugot => ["Flying Pigs"],
	 :Suzuki => ["Samurai"],
	 :Ford => ["Mustang", "F150", "F250"]

}

new_dealership = CarDealer.new(cars_array)

new_dealership.output_car_string


