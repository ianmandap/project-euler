# Problem Statement
# Starting with 1 and spiralling anticlockwise in the following way,
# a square spiral with side length 7 is formed.

# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49

# It is interesting to note that the odd squares lie along the bottom right diagonal,
# but what is more interesting is that 8 out of the 13 numbers lying along both diagonals
# are prime; that is, a ratio of 8/13 ≈ 62%.

# If one complete new layer is wrapped around the spiral above, a square spiral with
# side length 9 will be formed. If this process is continued,
# what is the side length of the square spiral for which the
# ratio of primes along both diagonals first falls below 10%?

require_relative 'euler'
include Euler

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  vertices_size = 1
  primes_size = 0.0
  p_v_ratio = 1

  # Similar to Euler Problem 028
  (3..).step(2).each do |num| # Iterate infinitely
    # Get perfect square vertex for current n x n square
    # For all other vertices, test for primality
    max_vertex = num**2
    3.times do
      max_vertex -= (num - 1)
      primes_size += 1 if is_prime_simple?(max_vertex)
    end

    # Recompute p_v_ratio
    vertices_size += 4
    p_v_ratio = primes_size / vertices_size

    # Check progress
    # p "#{num} #{p_v_ratio}"

    # Check for condition
    if p_v_ratio < 0.1
      p num
      break
    end
  end

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 26241
# Problem computed in 7.237928264999937s
# Can be improved upon using other primality tests such as Miller-Rabin test
