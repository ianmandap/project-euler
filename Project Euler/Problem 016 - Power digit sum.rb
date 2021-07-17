# Problem Statement:
# 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2**1000?

def power_digit_sum(base, exp)
  sum = base**exp
  array = sum.to_s.split('')
  array.reduce(0) {|acc, num| acc + num.to_i}
end

p power_digit_sum(2,15)
p power_digit_sum(2,1000) #=> 1366