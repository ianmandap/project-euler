# Problem Statement:
# What is the largest prime factor of the number 600851475143 ?

def prime_factorization(num)
  # Find prime factorization of a number using trial division
  # Start by testing each integer(using counter) to see if it divides the num and its quotients evenly
  # If divides evenly, save the number and continue
  # If not, increment counter
  # Limit division operation up to sqrt of num
  factors = []
  counter = 2
  largest = num

  while counter <= Math.sqrt(num).floor
    if largest % counter == 0 # If evenly divides
      factors << counter # save counter as factor
      largest /= counter
    else
      counter += 1
    end
    # p factors # show progress
  end
  # Add current largest as a prime factor if the
  # above loop does not reduce it to <= 2
  factors << largest if largest > 2
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