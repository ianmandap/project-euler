# Problem Statement
# The smallest number expressible as the sum of a prime square, prime cube, 
# and prime fourth power is 28. In fact, there are exactly four numbers 
# below fifty that can be expressed in such a way:

# 28 = 2**2 + 2**3 + 2**4
# 33 = 3**2 + 2**3 + 2**4
# 49 = 5**2 + 2**3 + 2**4
# 47 = 2**2 + 3**3 + 2**4

# How many numbers below fifty million can be expressed as the sum of a prime square, 
# prime cube, and prime fourth power?

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

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  # Set limit of generating primes by finding the nth root of 50000000
  max_x = (50000000**(1.0/2)).ceil # 7072
  max_y = (50000000**(1.0/3)).ceil # 369
  max_z = (50000000**(1.0/4)).ceil # 85
  
  primes = sieve(max_x)
  prime_power_triples = []

  for x in primes
    for y in primes
      break if y > max_y
      for z in primes
        break if z > max_z
        computed = x**2 + y**3 + z**4
        if computed < 50000000
          prime_power_triples << computed
        end
      end
    end
  end

  prime_power_triples.uniq!
  # p prime_power_triples.sort! # see prime list

  print "There are #{prime_power_triples.length} numbers below fifty million that can be expressed "
  print "as the sum of a prime square, prime cube, and prime fourth power \n"
  
  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
#=> 1097343
# 0.5237199839998539s