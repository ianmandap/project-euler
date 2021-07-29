# Problem Statement
# It was proposed by Christian Goldbach that every odd composite number 
# can be written as the sum of a prime and twice a square.

# 9 = 7 + 2×1**2
# 15 = 7 + 2×2**2
# 21 = 3 + 2×3**2
# 25 = 7 + 2×3**2
# 27 = 19 + 2×2**2
# 33 = 31 + 2×1**2

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as 
# the sum of a prime and twice a square?

def goldbachs_odd_composite_conjecture?(num, primes, squares)
  primes.each {|p|
    break if p > (num-1)
    squares.each {|sq|
      computed = p + (2*sq)
      break if computed > num
      return true if computed == num
    }
  }

  false
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

def gen_seq_of_squares(n)
  arr = []
  for i in 1..n
    arr << i**2
  end
  arr
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  limit = 10000 # arbitrary
  ans = false

  squares = gen_seq_of_squares(Math.sqrt(limit).to_i)
  primes = sieve(limit)
  
  odd_composites = ((2..limit).to_a - primes).reduce([]) {|arr,num|
    arr << num if num.odd?
    arr
  }

  odd_composites.each {|num|
    unless goldbachs_odd_composite_conjecture?(num, primes, squares)
      ans = num
      break
    end
  }

  print "The smallest odd composite that cannot be written as the "
  print "sum of a prime and twice a square is : #{ans} \n"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 5777 
# Problem computed in 0.2781583210003191s