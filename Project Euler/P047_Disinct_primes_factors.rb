# Problem Statement
# The first two consecutive numbers to have
# two distinct prime factors are:
# 14 = 2 * 7
# 15 = 3 * 5

# The first three consecutive numbers to have
# three distinct prime factors are:
# 644 = 2**2 * 7 * 23
# 645 = 3 * 5 * 43
# 646 = 2 * 17 * 19.

# Find the first four consecutive integers to have
# four distinct prime factors each. What is the first
# of these numbers?

def prime_factorization(num)
  # From Problem 3
  factors = []
  counter = 2
  quotient = num

  while quotient != 1
    if (quotient % counter).zero? # If evenly divides
      factors << counter # save counter
      quotient /= counter
    else
      counter += 1
    end
  end

  factors
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  i = 647
  num1 = num2 = num3 = num4 = []

  loop do
    num1 = prime_factorization(i).uniq
    num2 = prime_factorization(i + 1).uniq if num1.length == 4
    num3 = prime_factorization(i + 2).uniq if num2.length == 4
    num4 = prime_factorization(i + 3).uniq if num3.length == 4
    break if num4.length == 4 && num3.length == 4 && num2.length == 4 && num1.length == 4

    i += 1
  end

  print "The first number is #{i} \n"
  p "#{num1}, #{num2}, #{num3}, #{num4}"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# The first number is 134043
# "[3, 7, 13, 491], [2, 23, 31, 47], [5, 17, 19, 83], [2, 3, 11, 677]"
# Problem computed in 110.96622549899985s
