# Problem Statement
# The 5-digit number, 16807=7**5, is also a fifth power. 
# Similarly, the 9-digit number, 134217728=8**9, is a ninth power.
# How many n-digit positive integers exist which are also an nth power?

def count_digit_places(num)
  num.to_s.length
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  array_of_n_digits = []

  for base in 1..99
    for e in 1..99
      n = base**e
      array_of_n_digits << n if e == count_digit_places(n)
    end
  end

  print "There are #{array_of_n_digits.length} n-digit positive integers that exist that are also an nth power \n"
  p array_of_n_digits
  
  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
#=> 49
# 0.02397445699898526s