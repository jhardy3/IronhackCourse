beginning_number = 1

while beginning_number < 101 do
	if (beginning_number % 3 == 0)  && (beginning_number % 5 == 0) 
		puts "Fizz Buzz"
	elsif (beginning_number % 3 == 0) 
		puts "Fizz"
	elsif (beginning_number % 5 == 0) 
		puts "Buzz"
	else 
		puts beginning_number
	end

	beginning_number = beginning_number + 1
end

for i in 1..100 
	if i % 3 == 0 && i % 5 == 0 
		puts "FizzBuzz"
	elsif i % 3 == 0
		puts "Fizz"
	elsif i % 5 == 0
		puts "Buzz"
	else 
		puts i
	end
end

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

array = []

for i in 1..100 
	array.push i
end

array.each do |i|
	output = ""
	if i % 3 == 0 && i % 5 == 0 
		output = "FizzBuzz"
	elsif i % 3 == 0
		output = "Fizz"
	elsif i % 5 == 0
		output = "Buzz"
	else 
		output = i.to_s
	end
	number_array = i.to_s.split('')
	if number_array[0] == "1"
		if output.is_integer?
			output = "Bang"
		else
			output << "Bang" 
		end
	end 
	puts output
end

for i in 1..100
	output_string = ""
	if i % 3 == 0 
		output_string << "Fizz" 
	end
	if i % 5 == 0 
		output_string << "Buzz"	
	end
	if i.to_s.split('')[0] == "1"
		output_string << "Bang"
	end
	if output_string.to_s.split.empty? == true
	puts i
	else 
	puts output_string 
end
end




