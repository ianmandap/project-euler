# Problem Statement
# Some positive integers n have the property that the sum [ n + reverse(n) ] 
# consists entirely of odd (decimal) digits. For instance, 36 + 63 = 99 and 409 + 904 = 1313. 
# We will call such numbers reversible; so 36, 63, 409, and 904 are reversible. 
# Leading zeroes are not allowed in either n or reverse(n).
# There are 120 reversible numbers below one-thousand.
# How many reversible numbers are there below one-billion (10**9)?

def reverse_num(num)
  num.to_s.reverse.to_i
end

def num_reversible?(num)
  # Check if 0 in ones place
  return false if num % 10 == 0

  rev = reverse_num(num)
  sum = rev + num

  # Check all digits in sum odd?
  while sum > 1
    return false if sum.to_s[-1].to_i.even? # check every digit place if even
    sum /= 10
  end

  return true
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  # brute force solution
  reversible_numbers = 0

  for i in 10..(10**9)
    next if i.even? # skip even since: even + even = even
    reversible_numbers += 2 if num_reversible?(i)
  end

  print "There are #{reversible_numbers} reversible numbers below one-billion \n"
  
  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
#=> 608720
# 504.3429s or 8.4minutes