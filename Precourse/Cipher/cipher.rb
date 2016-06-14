
input_to_test = gets.chomp

def encode_cipher(input, offset)
	output = ""
	input.each_char { |c| 
		if c == " "
			output << " "
		end
		if ((c.ord + offset) > 122) 
			mod_sum = (((c.ord + offset) % 122) + 96).chr
			if mod_sum != nil 
				output << mod_sum
			end
		else 
			regular_sum = (c.ord + offset).chr
			if regular_sum != nil 
				output << regular_sum
			end
		end
	}
	return output
end

def solve_cipher(input, offset)
	output = ""
	input.each_char { |c| 
		if c == " "
			output << " "
		end
		if ((c.ord + offset) > 122) 
			mod_sum = (((c.ord + offset) % 122) + 96).chr
			if mod_sum != nil 
				output << mod_sum
			end
		else 
			regular_sum = (c.ord + offset).chr
			if regular_sum != nil 
				output << regular_sum
			end
		end
	}
	return output
end


puts solve_cipher("ifmmp", -1)
puts solve_cipher(encode_cipher(input_to_test, 3), -3)
puts solve_cipher("p| uhdo qdph lv grqdog gxfn", -3)