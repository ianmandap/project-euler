# Problem Statement
# Starting with the number 1 and moving to the right
# in a clockwise direction a 5 by 5 spiral is formed as follows:

# 43 44 45 46 47 48 49
# 42 21 22 23 24 25 26
# 41 20  7  8  9 10 27
# 40 19  6  1  2 11 28
# 39 18  5  4  3 12 29
# 38 17 16 15 14 13 30
# 37 36 35 34 33 32 31

# It can be verified that the sum of the numbers on the diagonals is 101.
# What is the sum of the numbers on the diagonals
# in a 1001 by 1001 spiral formed in the same way?

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  sum_of_diagonals = 1 # start with 1x1 square

  # Realize that for every n x n square, its top right vertex is n**2
  # Other vertices can be computed by subtracting n - 1 each time from the last computed vertex
  (3..1_001).step(2).each do |num|
    vertices = [num**2]
    3.times { vertices << (vertices[-1] - (num - 1)) }
    sum_of_diagonals += vertices.sum
  end

  p sum_of_diagonals

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 669171001
# Problem computed in 0.0007669560000067577s
