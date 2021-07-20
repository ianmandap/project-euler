# Problem Statement
# The number 512 is interesting because it is equal to the sum of its digits raised to some power:
# 5 + 1 + 2 = 8, and 8**3 = 512. Another example of a number with this property is 614656 = 28**4.
# We shall define an to be the nth term of this sequence and insist that a number must contain 
# at least two digits to have a sum.
# You are given that a2 = 512 and a10 = 614656.
# Find a30.

def sum_of_digits(num)
  array = num.to_s.split('')
  array.reduce(0) {|acc, num| acc + num.to_i}
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  # Brute force
  # Chosen ranges arbitrary
  sequence = []

  for base in 2..100
    for exp in 2..9
      x = base ** exp
      sequence << x if sum_of_digits(x) == base
    end
  end

  sequence.sort!

  print "a30 in the said sequence is : #{sequence[30-1]} \n"
  p sequence
  
  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main 
#=> 248155780267521
# 0.0036705699999401986s