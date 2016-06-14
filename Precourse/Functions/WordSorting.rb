
input = gets.chomp

new_input = input.gsub(/[^a-z0-9\s]/i, '')
array_of_strings = new_input.split(" ")


alpha_array = array_of_strings.sort_by { |m| m.downcase }


print alpha_array