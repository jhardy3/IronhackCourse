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

def better_sieve_upto(n)
  s = (0..n).to_a
  s[0] = s[1] = nil
  s.each do |p|
    next unless p
    break if p * p > n
    (p*p).step(n, p) { |m| s[m] = nil }
  end
  puts s.compact
end

puts Benchmark.measure{better_sieve_upto(1000000)}
