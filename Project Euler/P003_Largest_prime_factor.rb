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

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  print "The largest prime factor of the number 600851475143 is: "
  print "#{prime_factorization(600851475143).max} \n" 

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 6857
# 0.038088982000090255s