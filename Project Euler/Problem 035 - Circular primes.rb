# Problem Statement
# The number, 197, is called a circular prime because all rotations of the digits: 
# 197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# How many circular primes are there below one million?

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

def rotate_right(num)
  str = num.to_s
  num = str[-1] + str[0..-2]
  num.to_i
end

def rotations_prime?(num, sieve)
  length = num.to_s.length
  counter = 0

  while counter != length
    return false unless (sieve.include?(num))
    num = rotate_right(num)
    counter += 1
  end

  true
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  sieve = sieve(1000000)
  circular_primes = []

  sieve.each {|num|
    if num < 100
      if [2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97].include?(num)
        circular_primes << num
        next
      end
    end

    circular_primes << num if rotations_prime?(num, sieve)
  }

  p circular_primes
  print "There are #{circular_primes.length} circular primes below one million? \n"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# There are 55 circular primes below one million? 
# Problem computed in 69.27688578400011s