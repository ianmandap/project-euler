# Problem Statement
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330,
# is unusual in two ways: (i) each of the three terms are prime, and,
# (ii) each of the 4-digit numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
# exhibiting this property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this sequence?

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

def permutation?(num1, num2)
  num1.to_s.split('').sort == num2.to_s.split('').sort
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  # Select no. of digits in prime to be searched
  digits = 4
  results = []

  # Create list of primes
  sieve = sieve(10**digits)
  primes = sieve.filter { |n| n.to_s.length == digits }.sort

  # Iterate through the list, test each pair of prime
  for i in 0...primes.length do
    for j in (i+1)...primes.length do
      a = primes[i]
      b = primes[j]
      # Check if permutation of each other
      if permutation?(a, b)
        # Find next in sequence
        c = 2 * b - a
        # Check if permutation and if prime
        if permutation?(c, a) && primes.include?(c)
          results << [a, b, c]
        end
      end
    end
  end

  p results
  puts results[-1].reduce('') {|str, num|
    str << num.to_s
    str
  }

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# [[1487, 4817, 8147], [2969, 6299, 9629]]
# 296962999629
# Problem computed in 1.4842043420003392s
