# Problem Statement:
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

def is_prime_lazy_eval(number)
  return true if number == 2
  # Push into array if not divisible by the num currently iterating over
  array = (2...number).take_while {|num| number % num != 0}

  if array.length == (number -2)
    return true
  else
    return false
  end
end

def find_nth_prime(n)
  prime_list = []
  integer = 2

  while prime_list.length != n
    # p prime_list.length # see progress
    if is_prime_lazy_eval(integer)
      prime_list << integer
    end

    integer += 1
  end

  prime_list[n-1]
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  p "The 10 001st prime number is #{find_nth_prime(10001)}"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 104743
# 41.93130261800002s