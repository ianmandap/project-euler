# Problem Statement:
# What is the largest prime factor of the number 600851475143 ?

def prime_factorization(num)
  # Find prime factorization of a number using trial division
  # Start by testing each integer(using counter) to see if it divides the num and its quotients evenly
  # If divides evenly, save the number and continue
  # If not, increment counter
  factors = []
  counter = 2
  quotient = num

  while quotient != 1
    if quotient % counter == 0 # If evenly divides
      factors << counter # save counter
      quotient /= counter
    else
      counter += 1
    end
    p factors # show progress
  end

  factors
end

p "The largest prime factor of the number 600851475143 is: #{prime_factorization(600851475143).max}" # 6857