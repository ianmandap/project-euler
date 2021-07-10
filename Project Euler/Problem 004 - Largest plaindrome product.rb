# Problem Statement:
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome?(num)
  num.to_s.reverse == num.to_s
end

max = 0

for i in 100..999
  for j in 100..999
    number = i*j
    max = number if (is_palindrome?(number) && number > max) 
  end
end

p "The largest palindrome made from the product of two 3-digit numbers is: #{max}" 