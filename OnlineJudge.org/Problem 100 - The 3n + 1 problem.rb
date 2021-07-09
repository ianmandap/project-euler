# Problem Statement:
# Given an inputn, it is possible to determine the number of numbers printed before and including
# the 1 is printed.  For a given n this is called the cycle-length of n. 
# For any two numbers i and j, determine the max cycle length over all numbers between
# and including both i and j

# Output i, j, and the max cycle length for integers between and including i and j.

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

# Test
# p algorithm_3n_plus_one(22) == 16

def get_max_cycle_length(i,j)
  array = (i..j).reduce([]) {|acc, num| acc << algorithm_3n_plus_one(num)}
  "#{i} #{j} #{array.max}"
end

p get_max_cycle_length(1,10) == "1 10 20"
p get_max_cycle_length(100,200) == "100 200 125"
p get_max_cycle_length(201,210) == "201 210 89"
p get_max_cycle_length(900,1000) == "900 1000 174"

