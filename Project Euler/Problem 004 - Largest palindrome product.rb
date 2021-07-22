# Problem Statement:
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome?(num)
  num.to_s.reverse == num.to_s
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  max = 0

  for i in (100..999).reverse_each
    for j in (100..999).reverse_each
      # Check if duplicated operation
      if j < i
        break
      end
      
      number = i*j

      if number <= max
        break
      end

      max = number if is_palindrome?(number) 
    end
  end

  p "The largest palindrome made from the product of two 3-digit numbers is: #{max}" 

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 906609
# 0.035210356999868964s