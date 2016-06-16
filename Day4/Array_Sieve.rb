require 'benchmark'
require 'bigdecimal/math'

# calculate pi to 10k digits
def sieve(array)
  if array.length == 0
    []
  else
    sieved = array.select { |number| number % array[0] != 0 }
    [array[0]] + sieve(sieved)
  end
end



array = []

for i in 2..100
  array.push(i)
end

puts Benchmark.measure{sieve(array)}
