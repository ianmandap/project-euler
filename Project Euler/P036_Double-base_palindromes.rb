# Problem Statement
# The decimal number, 585 = 1001001001(subscript)2 (binary), is palindromic in both bases.
# Find the sum of all numbers, less than one million, 
# which are palindromic in base 10 and base 2.
# (Please note that the palindromic number, in either base, may not include leading zeros.)

def is_palindrome?(num)
  num.to_s.reverse == num.to_s
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  double_palindromic_array = []
  sum = 0

  for num in 1..999999
    if is_palindrome?(num)
      bin = num.to_s(2).to_i
      if is_palindrome?(bin)
        sum += num
        double_palindromic_array << num
      end
    end
  end

  print "Sum of all numbers, less than one million, which are palindromic in base "
  print "10 and base 2 is: #{sum} \n"
  p double_palindromic_array

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 872187 
# [1, 3, 5, 7, 9, 33, 99, 313, 585, 717, 7447, 9009, 15351, 32223, 39993, 53235, 53835, 73737, 585585]
# Problem computed in 0.494736438999098s