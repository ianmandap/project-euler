# Problem Statement
# Surprisingly there are only three numbers that can be written as 
# the sum of fourth powers of their digits:
#     1634 = 1**4 + 6**4 + 3**4 + 4**4
#     8208 = 8**4 + 2**4 + 04 + 8**4
#     9474 = 9**4 + 4**4 + 7**4 + 4**4

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

def written_as_sum_of_powers?(power, number)
  array = number.to_s.split('')
  sum = array.reduce(0) {|acc, n| acc + (n.to_i)**power}
  number == sum
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  array_of_nos = []
  sum = 0
  
  # Since max value for a digit is 9**5 = 59049, 
  # limit range to 59049 * 6 = 354294 (6 digits)
  # We know a 7 digit number can't be found because 59049 * 7 = 413,343 which is a 6 digit num
  for n in 10..354294
    # p n # see progress
    if written_as_sum_of_powers?(5, n)
      sum += n
      array_of_nos << n
    end
  end

  print "The sum of all the numbers that can be written as the sum of fifth powers of their digits is: #{sum} \n"
  p array_of_nos

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  runtime = finish_time - start_time
  puts "Problem computed in #{runtime}s"
end

main
#=> 443839; [4150, 4151, 54748, 92727, 93084, 194979]
# 0.5816155110005639s
