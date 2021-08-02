# Problem Statement
# It can be seen that the number, 125874, and its double,
# 251748, contain exactly the same digits, but in a different order.
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

require_relative 'euler'
include Euler

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  smallest = 0
  (120...10_000_000).each do |num|
    next unless permutation?(num, num * 6)
    next unless permutation?(num, num * 5)
    next unless permutation?(num, num * 4)
    next unless permutation?(num, num * 3)
    next unless permutation?(num, num * 2)

    smallest = num
    break
  end

  p smallest

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 142857
# Problem computed in 0.3462671640008921s
