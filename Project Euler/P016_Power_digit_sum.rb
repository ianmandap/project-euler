# Problem Statement:
# 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2**1000?

def power_digit_sum(base, exp)
  sum = base**exp
  array = sum.to_s.split('')
  array.reduce(0) {|acc, num| acc + num.to_i}
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  p power_digit_sum(2,15)
  p power_digit_sum(2,1000) #=> 1366

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 1366
# Problem computed in 0.00011805600024672458s