# Problem Statement
# Euler's Totient function, φ(n) [sometimes called the phi function],
# is used to determine the number of numbers less than n which are relatively prime to n.
# For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and
# relatively prime to nine, φ(9)=6.

# n 	Relatively Prime 	φ(n) 	  n/φ(n)
# 2 	1 	              1 	    2
# 3 	1,2 	            2 	    1.5
# 4 	1,3 	            2 	    2
# 5 	1,2,3,4 	        4 	    1.25
# 6 	1,5 	            2 	    3
# 7 	1,2,3,4,5,6 	    6 	    1.1666...
# 8 	1,3,5,7 	        4 	    2
# 9 	1,2,4,5,7,8 	    6 	    1.5
# 10 	1,3,7,9 	        4 	    2.5

# It can be seen that n=6 produces a maximum n/φ(n) for n ≤ 10.
# Find the value of n ≤ 1,000,000 for which n/φ(n) is a maximum.

require_relative 'euler'
include Euler
# Import totient_function

# Analysis
# https://brilliant.org/wiki/eulers-totient-function/
# As with any multiplicative function, computing ϕ(n) can be reduced to factoring n 
# as a product of prime powers, n =p1**e1 … pk**ek​, and expressing ϕ(n)
# as the product of the ϕ(pi**ei).

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  num_max = 0
  totient_max = 0 # n / totient function
  sieve = sieve(1_000_000)

  (2..1_000_000).each do |n|
    next if sieve.include?(n) # Avoids prime numbers

    prime_factors = prime_factorization(n).uniq
    totient = prime_factors.reduce(n) { |prod, num| prod * (1 - (1.0 / num)) }
    n_div_totient = n / totient

    if n_div_totient > totient_max
      num_max = n
      totient_max = n_div_totient
    end
  end

  p totient_max
  p num_max

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

# main
# 510510
# Or simply realize that to have max n/phi(n), num would need to have a small phi(n);
# To have a small phi(n), num would need many prime factors;
# As such the max number that has factors of many unique primes less than the limit is:
# 2 * 3 * 5 * 7 * 11 * 13 * 17 = 510510
# Problem computed in 578.0446773410004s