# Problem Statement:
# The sum of the squares of the first ten natural numbers is 1**2 + 2**2 + ... + 10**2 = 385
# The square of the sum of the first ten natural numbers is (1+2+..+10)**2 = 3025
# Hence, difference is 2640
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
range = (1..100)

def sum_of_squares_of_numbers(range)
  range.reduce(0) {|acc, num| acc + num**2}
end

def sum_of_numbers_squared(range)
  range.reduce(0) {|acc, num| acc + num}**2
end

print "The difference between the sum of the squares of the first one hundred natural numbers and the square of the sum is: "
print sum_of_numbers_squared(range) - sum_of_squares_of_numbers(range) #=> 25164150