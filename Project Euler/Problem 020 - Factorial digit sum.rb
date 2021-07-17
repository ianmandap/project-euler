# Problem Statement
# n! means n × (n − 1) × ... × 3 × 2 × 1
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!

def factorial(n)
  (1..n).reduce(1) {|prod, num| prod*num}
end

def sum_of_digits(num)
  array = num.to_s.split('')
  array.reduce(0) {|acc, num| acc + num.to_i}
end

fact = factorial(10) #=> 3628800
sum_of_digits(fact) #=> 27

p "The sum of the digits in the number 100! is #{sum_of_digits(factorial(100))}"