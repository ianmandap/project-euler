# Problem Statement
# A number chain is created by continuously adding the square of the digits
# in a number to form a new number until it has been seen before.

# For example,
# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
# Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop.
# What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
# How many starting numbers below ten million will arrive at 89?

require_relative 'euler'
include Euler

def digit_square(num)
  product = 0
  while num > 0
    digit = num % 10
    num /= 10
    product += digit**2
  end
  product
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  counter = 0

  (1...10_000_000).each do |num|
    loop do
      num = digit_square(num)

      if num == 89
        counter += 1
        break
      end
      break if num == 1
    end
  end

  p counter

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 8581146
# Problem computed in 19.167956919998687