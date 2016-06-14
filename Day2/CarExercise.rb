require "pry"

class Car

	def initialize(type, year, model, car_sound, cities = [])
    @cities = cities
		@type = type
		@year = year
		@model = model
		@car_sound = car_sound
	end

	def make_sound
		puts @car_sound
	end

  def self.speed_control
    puts "Enter your current speed: "
    speed = gets.chomp.to_i
    if speed > 100
      puts "Slow your ass down"
    else
      puts "Nice speed"
    end
  end

  def city_visited
    puts "Enter the cities you have visited: "
    city = gets.chomp
    binding.pry

    if city.include? (",")
      split_cities = city.split(", ")
      @cities = @cities + split_cities
    else
      @cities.push(city)
    end

    cities_string = @cities.reduce("") do |pas_str, city|
      pas_str + "\n#{city}"
    end

    IO.write("#{self.object_id}.txt", cities_string)
  end

  def print_cities
    puts "Cities I visited with my #{@model}"
    @cities.each do |city|
      puts city
    end
  end

  def save_visited
    cities_string = @cities.reduce("") do |pas_str, city|
      pas_str + "\n#{city}"
    end

    IO.write("#{self.object_id}.txt", cities_string)
    IO.read("cities.txt")
  end
end

class RacingCar < Car

  def make_sound
    puts "BRRRRRRROOOOOO"
  end


end

new_car = Car.new("Ford", 1969, "Mustang", "VRRRRRRRRRROOOOOOOOM")
old_car = Car.new("Suzuki", 1988, "Samurai", "weeeeeeeEEEEEEEE")
racing_car = RacingCar.new("Suzu", 1944, "Sami", "BRRRROOOOM")
racing_car.make_sound

# Car.speed_control

new_car.city_visited
new_car.print_cities

# new_car.make_sound
# old_car.make_sound
