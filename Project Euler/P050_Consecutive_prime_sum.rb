# Problem Statement
# The prime 41, can be written as the sum of six consecutive primes:
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a 
# prime below one-hundred.
# The longest sum of consecutive primes below one-thousand that 
# adds to a prime, contains 21 terms, and is equal to 953.
# Which prime, below one-million, can be written as the sum of 
# the most consecutive primes?

def sieve(n)
  # Array of true values, indexed by integers 2 to n
  range = Array.new(n + 1, true)
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

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  # Enter limit
  limit = 1_000_000
  start_limit = 20 # starting consecutive terms to test

  # Initialize variables
  sieve = sieve(limit)
  max_consecutive_sum = 0
  max_terms = 0
  max_i = 0
  max_j = 0

  # Find out max counter limit that sums to target limit
  counter_limit = start_limit
  extracted_array = sieve[0..counter_limit]
  while extracted_array.reduce(&:+) < limit
    counter_limit += 1
    extracted_array = sieve[0..counter_limit]
  end

  # Iterate through sieve and extract Array ranges to test
  for i in 0...counter_limit
    for j in start_limit...counter_limit
      next if i >= j

      terms = j - i + 1
      next if max_terms > terms

      test_array = sieve[i..j]
      sum = test_array.reduce(&:+)
      next if sum >= limit

      # Test if sum is prime
      if sieve.include?(sum)
        if terms > max_terms
          max_consecutive_sum = sum
          max_terms = terms
          max_i = i
          max_j = j
        end
      end
    end
  end

  puts "Below #{limit}, the prime that can be written as the sum of the most\n"
  puts "consecutive primes is : #{max_consecutive_sum} with #{max_terms} terms\n"
  puts "Primes from i: #{max_i} to j: #{max_j}"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# Below 1000000, the prime that can be written as the sum of the most
# consecutive primes is : 997651 with 543 terms
# Primes from i: 3 to j: 545
# Problem computed in 0.7506938480000827s
