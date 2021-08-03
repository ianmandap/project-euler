# Problem Statement
# In combinatorics, we use the notation n! / r!(n-r)!, where r <= n
# It is not until n = 23, that a value exceeds 1 million (23 / 10) =1144066
# How many, not necessarily distinct, values of (n / r) 
# for 1 <= n <= 100, are greater than one-million?

require_relative 'euler'
include Euler

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  array = []
  (10..100).each do |n|
    (1..100).each do |r|
      break if r > n

      array << [n, r] if combinatorics(n, r) > 1_000_000
    end
  end

  p array.length

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main