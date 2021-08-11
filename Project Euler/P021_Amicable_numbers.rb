# Problem Statement
# Let d(n) be defined as the sum of proper divisors of n
# (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair
# and each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.

require_relative 'euler'
include Euler

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  amicable_nums = []
  (10...10_000).each do |num|
    next if amicable_nums.include?(num)

    da = proper_divisors(num).sum
    db = proper_divisors(da).sum unless da == num
    amicable_nums << da << db if db == num
  end

  p amicable_nums
  p amicable_nums.sum

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# [284, 220, 1210, 1184, 2924, 2620, 5564, 5020, 6368, 6232]
# 31626
# Problem computed in 2.9917327889997978s