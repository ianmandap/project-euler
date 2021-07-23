# Problem Statement
# The number 3797 has an interesting property. Being prime itself, it is possible to 
# continuously remove digits from left to right, and remain prime at each stage: 3797, 
# 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from 
# left to right and right to left.
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

def truncate_left(num)
  num.to_s[1..-1].to_i
end

def truncate_right(num)
  num.to_s[0..-2].to_i
end

def truncatable_prime?(num, sieve)
  length = num.to_s.length
  counter = 0
  # num already a prime
  l_truncated = truncate_left(num)
  r_truncated = truncate_right(num)

  while counter != (length - 1)
    return false unless sieve.include?(l_truncated)
    return false unless sieve.include?(r_truncated)
    l_truncated = truncate_left(l_truncated)
    r_truncated = truncate_right(r_truncated)
    counter += 1
  end

  true
end

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

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  primes = sieve(1000000)
  truncatable_primes = []
  
  primes.each {|num|
    next if num < 10
    if truncatable_prime?(num, primes)
      truncatable_primes << num
      p truncatable_primes
    end
  }

  print "The sum of the only eleven primes that are both truncatable from left to right "
  print "and right to left is #{truncatable_primes.reduce(&:+)} \n"
  p truncatable_primes

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 748317 
# [23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397]
# Problem computed in 41.80269840599976s