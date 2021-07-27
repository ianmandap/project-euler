# Problem Statement
# We shall say that an n-digit number is pandigital if it makes use of all the digits
# 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
# What is the largest n-digit pandigital prime that exists?

# Unused Method
def is_pandigital_1_to_n?(num)
  # Pandigital if makes use of all digits 1 to n exactly once
  # E.g. 2143, a 4 digit number, is pandigital
  length = num.to_s.length
  str = num.to_s.split('').sort.join
  
  comparison = ''
  for i in (1..length)
    comparison += i.to_s
  end

  str == comparison ? true : false
end

def is_prime?(number)
  # O(sqrt(N))
  return false if number < 0
  return false if number == 1 || number == 2
  limit = Math.sqrt(number)

  (2...limit).each {|num|
    return false if number % num == 0 
  }
  true
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  # Test all permutations of n-numbered digits starting at 9
  # All permutations acquired are already pandigital
  # Test numbers in permutations in reverse if prime
  # The first prime number that passes is automatically the largest n-digit prime pandigital
  max = 0

  # Get permutations of n-numbered digits starting at 9
  for i in (1..9).reverse_each
    permutations = (1..i).to_a.permutation.to_a
    permutations.map! {|arr| arr.join.to_i}
    permutations.sort!
    permutations.reverse_each {|num|
      if is_prime?(num)
        max = num
        break
      end
    }
    
    break if max != 0
  end

  p "The largest n-digit pandigital prime that exists is #{max}"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# "The largest n-digit pandigital prime that exists is 7652413"
# Problem computed in 1.141203057999519s