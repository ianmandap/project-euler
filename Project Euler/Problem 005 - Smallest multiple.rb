# Problem Statement:
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def is_prime(number)
  (2...number).all? {|num|
    number % num != 0 
  }
end

def find_smallest_multiple_in_range(j, k)
  smallest = 0
  # Using unique factorization theorem, 'smallest' can be expressed as a product of prime numbers
  # Since it has to be divisible by 1..20, we can iterate through the product of prime numbers in this range
  # We use the said product as counter to iterate through numbers to check
  counter = (j..k).reduce(1) {|acc, num|
    is_prime(num) ? acc * num : acc
  } 
  index = counter

  while smallest == 0
    all_divisible = (j..k).all? { |num|
      index % num == 0
    }
    if all_divisible
      smallest = index
    else
      # p index # see progress
      index += counter
    end
  end
  smallest
end


p "The smallest positive number that is evenly divisible by all of the numbers from 1 to 10 is: #{find_smallest_multiple_in_range(1, 10)}" #=> 2520
p "The smallest positive number that is evenly divisible by all of the numbers from 1 to 20 is: #{find_smallest_multiple_in_range(1, 20)}" #=> 232792560
p "The smallest positive number that is evenly divisible by all of the numbers from 1 to 30 is: #{find_smallest_multiple_in_range(1, 30)}" #=> 2329089562800