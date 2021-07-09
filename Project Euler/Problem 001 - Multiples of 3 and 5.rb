# Problem Statement:
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_of_multiples_of_3_and_5(number)
  # First we find out how many multiples of 3, 5, and 15 (LCM) are in the number
  # E.g. n = 100; there are 33 max multiples of 3 in the number below 99
  # Continuing, we can realize that 3*33 can be turned into 3*(1+2+3...+33)
  # We can then use the summation formula on multiples of 3 and 5.
  # Adding both, we will get duplicate values because of their LCM (15)
  # As such, we remove the sum of the multiples of 15 to get our final answer

  multiples_three = (number-1) / 3
  sum_of_threes = 3 * (multiples_three * (multiples_three + 1)) / 2

  multiples_five = (number-1) / 5
  sum_of_fives = 5 * (multiples_five * (multiples_five + 1)) / 2

  multiples_LCM = (number-1) / 15
  sum_of_LCM = 15 * (multiples_LCM * (multiples_LCM + 1)) / 2

  answer = sum_of_threes + sum_of_fives - sum_of_LCM
end

p sum_of_multiples_of_3_and_5(2) == 0
p sum_of_multiples_of_3_and_5(10) == 23
p sum_of_multiples_of_3_and_5(100) == 2318
p sum_of_multiples_of_3_and_5(1000) == 233168

p "The sum of all multiples of 3 or 5 below 1000 is: #{sum_of_multiples_of_3_and_5(1000)}"