# Problem Statement
# The following iterative sequence is defined for the set of positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

def algorithm_3n_plus_one(num)
  arr = [num]
  while arr[-1] != 1
    if arr[-1].odd?
      arr << arr[-1]*3 +1
    else
      arr << arr[-1]/2
    end
  end
  arr.length
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  longest_chain_number = 1
  longest_chain = 1

  (2..1000000).each {|num|
    cycles = algorithm_3n_plus_one(num)
    if cycles > longest_chain
      longest_chain = cycles
      longest_chain_number = num
    end
  }

  p "The starting number under 1 million that produces the longest chain is : #{longest_chain_number} with #{longest_chain} terms"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 837799 with 525 terms
# Problem computed in 10.473254267999891s