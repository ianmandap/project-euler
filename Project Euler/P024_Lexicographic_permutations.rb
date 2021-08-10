# Problem Statement
# A permutation is an ordered arrangement of objects. 
# For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
# If all of the permutations are listed numerically or alphabetically,
# we call it lexicographic order.
# The lexicographic permutations of 0, 1 and 2 are:
# 012   021   102   120   201   210

# What is the millionth lexicographic permutation of the 
# digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?


def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].permutation.to_a[1_000_000 - 1]
  p num.join.to_i

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 2783915460
# Problem computed in 2.30468793s