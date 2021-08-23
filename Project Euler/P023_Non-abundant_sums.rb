# Problem Statement:
# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n
# and it is called abundant if this sum exceeds n.
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
# the smallest number that can be written as the sum of two abundant numbers is 24.

# By mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers
# is less than this limit.

# Find the sum of all the positive integers which cannot be written
# as the sum of two abundant numbers.

require_relative 'euler'
include Euler
# Import find_divisors method

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  # First generate abundant numbers
  abundant_nos = []
  (2..28_123).each do |num|
    abundant_nos << num if find_divisors(num).sum > num
  end

  # Obtain array of all possible values for the sum of two abundant numbers 
  possible_combinations = abundant_nos
                          .repeated_permutation(2)
                          .map { |a, b| a + b }
                          .uniq

  # Non-abundant numbers
  non_abundant_nos = (1..28_123).to_a - possible_combinations
  p non_abundant_nos.sum

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 4179871
# Problem computed in 7.980335425000021s
