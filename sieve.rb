require 'benchmark'

# Sieve of Erasthones
#
# This algorithm takes advantage of the fact that multiples of primes are not
# prime.

def primes_to(n)
  primes = [1]

  2.upto(n) do |num|
    primes << num if prime?(num)
  end

  primes
end

def better_primes_to(n)
  primes = [1]

  2.upto(n) do |num|
    primes << num if better_prime?(num)
  end

  primes
end

def prime?(n)
  return true if n == 1
  return false if n == 2

  2.upto(n-1) do |num|
    return false if n % num == 0 
  end

  true
end

def better_prime?(n)
  return true if n == 1
  return false if n == 2

  2.upto(Math.sqrt(n)) do |num|
    return false if n % num == 0 
  end

  true
end

#puts "============ Prime? test ============"
#puts prime?(1) # true
#puts prime?(5) # true
#puts prime?(2) # false
#puts prime?(4) # false
#puts prime?(11) # true
#puts prime?(10) # false
#puts "====================================="
#
#puts "======= naive_primes_to test ========"
#puts primes_to(14).join(',')
#puts primes_to(16).join(',')
#puts primes_to(11).join(',')
#puts primes_to(17).join(',')
#puts "====================================="
#puts "======= better_primes_to test ======="
#puts better_primes_to(14).join(',')
#puts better_primes_to(16).join(',')
#puts better_primes_to(11).join(',')
#puts better_primes_to(17).join(',')
#puts "====================================="
#
#n = 10_000
#
#Benchmark.bm do |x|
#  x.report('naive style:       ') { primes_to(n) }
#  x.report('square root style: ') { better_primes_to(n)}
#end

# The sieve of erasthones via cracking

def sieve(max)
  flags = Array.new(max + 1, true)
  prime = 2

  while(prime <= Math.sqrt(max)) do
    cross_off(flags, prime)

    prime = get_next_prime(flags, prime)
  end

  flags
end

def cross_off(flags, prime)
  i = prime * prime

  while i < flags.length do
    flags[i] = false
    i += prime
  end
end

def get_next_prime(flags, prime)
  next_prime = prime + 1

  while next_prime < flags.length && !flags[next_prime] do
    next_prime += 1
  end

  next_prime
end

sieve_result = sieve(14).each_with_index.reduce([]) do |acc, (el, i)|
  acc << i if el
  acc
end

puts sieve_result
puts sieve_test = [1,3,5,7,11,13].join(',')
