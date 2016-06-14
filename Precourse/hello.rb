puts "Hello, world!"

puts "I"
puts "like"
puts "pie."

print "Cookies"
print "are"
print "good"
print "too."


file_contents = IO.read("hello.rb")  
puts "The source file contains: #{file_contents}"



puts "What's your name?"
name = gets.chomp
IO.write('name.txt', name)
