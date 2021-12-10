# Problem Statement
# The number 145 is well known for the property that the sum of the factorial
# of its digits is equal to 145: 1! + 4! + 5! = 1 + 24 + 120 = 145

# Perhaps less well known is 169, in that it produces the longest chain of numbers
# that link back to 169; it turns out that there are only three such loops that exist:
# 169 → 363601 → 1454 → 169
# 871 → 45361 → 871
# 872 → 45362 → 872

# It is not difficult to prove that EVERY starting number will eventually get stuck in a loop.
# For example,
# 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
# 78 → 45360 → 871 → 45361 (→ 871)
# 540 → 145 (→ 145)

# Starting with 69 produces a chain of five non-repeating terms,
# but the longest non-repeating chain with a starting number below one million is sixty terms.
# How many chains, with a starting number below one million,
# contain exactly sixty non-repeating terms?

require_relative 'euler'
include Euler

def count_digit_factorial_chain(num)
  count = 1 # start with the number in the loop
  arr = [num]

  loop do
    num = number_to_array(num).reduce(0) { |acc, ele| acc + factorial(ele) }
    break if arr.include?(num)

    count += 1
    arr << num
  end

  count
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  exactly_60 = 0

  (1...1_000_000).each do |num|
    exactly_60 += 1 if count_digit_factorial_chain(num) == 60
  end

  p exactly_60

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 402
# Problem computed in 116.22973832200023s
# Brute force solution: checking of all numbers 1..1_000_000
