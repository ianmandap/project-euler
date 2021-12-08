# Problem Statement
# The cube, 41063625 (3453), can be permuted to produce two other cubes: 56623104 (384**3) and 66430125 (405**3).
# In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.
# Find the smallest cube for which exactly five permutations of its digits are cube.

require_relative 'euler'
include Euler

def count_cubic_permutations(cube)
  arr = number_to_array(cube)

  # Get cubic roots of max and min permutation of chosen number
  max = Math.cbrt(arr.sort.reverse.join.to_i)
            .floor
  min = Math.cbrt(arr.sort.join.to_i)
            .floor

  # Iterate through limits and test each cube to see if digit permutation is the same as original
  permutation_count = 0
  (min..max).each do |num|
    cube = num**3
    next if cube.to_s.size != arr.size

    permutation_count += 1 if number_to_array(cube).sort == arr.sort
  end

  permutation_count
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  (406..).each do |num|
    if count_cubic_permutations(num**3) == 5
      p "#{num}**3 = #{num**3}"
      break
    end
  end

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# "5027**3 = 127035954683"
# Problem computed in 41.02176633900308s
# Alternative more optimized solution is to generate cubes corresponding to n number of digits as this is faster
# than calculating permutations and checking for a cube
# Then, get a canonical representation as a sorted string to compare to. For example, 41062625 has a representation of
# 1111112000 which represents the frequency of digits 0-9
