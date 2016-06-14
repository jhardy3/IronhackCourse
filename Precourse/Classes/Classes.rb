
class Car

attr_accessor :color

def initialize(color) 
	@color = color
end

def honk 
	puts "beeeeeeeeep"
end

end

my_car = Car.new "Red"
other_car = Car.new "Gray"

puts my_car.color

puts my_car.class
puts my_car.honk
puts 4.class
