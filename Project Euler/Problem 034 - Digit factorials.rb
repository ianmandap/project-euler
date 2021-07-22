# Problem Statement
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# Note: As 1! = 1 and 2! = 2 are not sums they are not included.

def factorial(n)
  (1..n).reduce(1) {|prod, num| prod*num}
end

def sum_of_digits_factorial(num)
  array = num.to_s.split('')
  array.reduce(0) {|acc, num| acc + factorial(num.to_i)}
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  digit_factorials = []
  sum = 0

  for n in 3..(factorial(9))
    if n == sum_of_digits_factorial(n)
      digit_factorials << n
      sum += n
    end
  end
  
  print "The sum of all numbers which are equal to the sum of the factorial of their digits "
  print "is #{sum} \n"
  p digit_factorials

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 40730 
# Problem computed in 1.796611073999884s