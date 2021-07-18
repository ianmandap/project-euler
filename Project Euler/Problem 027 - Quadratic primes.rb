# Problem Statement
# Considering quadratics of the form:
# n**2 + an + b, where |a| < 1000 and |b| <= 1000
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |-4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression 
# that produces the maximum number of primes for consecutive values of n, starting with n=0.

def sieve(n)
  # Array of true values, indexed by integers 2 to n
  range = Array.new(n+1, true)
  range[0], range[1] = false, false
  p = 2

  for i in (2..(n/2))
    if range[i] == true
      counter = 0
      while (i**2 + (i * counter)) <= n
        range[i**2 + (i * counter)] = false
        counter += 1
      end
    end
  end
  
  list_of_primes = [] 
  range.each_with_index {|bool, idx|
    list_of_primes << idx if bool
  }
  list_of_primes
end

def is_prime(number)
  return false if number < 0

  (2...number).all? {|num|
    number % num != 0 
  }
end

def quadratic_formula(n,a,b)
  n**2 + (a*n) + b
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  primes_less_than_1000 = sieve(1000)
  @max_consecutive_primes = 0
  @a = nil
  @b = nil

  for x in -999..999
    for y in primes_less_than_1000 # coeff b should be prime if n starts at 0
      # p "#{x}, #{y}" # see progress

      counter = 0
      compute = quadratic_formula(counter, x, y)

      while is_prime(compute)
        counter += 1
        compute = quadratic_formula(counter, x, y)
      end

      if counter > @max_consecutive_primes
        @a = x
        @b = y
        @max_consecutive_primes = counter
      end
    end
  end

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
end

# computation takes ~13seconds
main

print "The product of the coefficients, a and b, for the quadratic expression that produces " 
print "the maximum no. of primes for consecutive values of n is #{@a*@b}; n**2 + #{@a}n + #{@b}"
print ": where 0 <= n <= #{@max_consecutive_primes-1} \n"
puts "Problem computed in #{@runtime}s"
#=> -59231; n**2 + -61n + 971: where 0 <= n <= 70