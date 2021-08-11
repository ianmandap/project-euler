# Problem Statement
# If the numbers 1 to 5 are written out in words:
# one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19
# letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive
# were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens.
# For example, 342 (three hundred and forty-two) contains 23 letters
# and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance
# with British usage.

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