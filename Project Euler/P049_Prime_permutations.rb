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

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  seq = []
  increment = []

  sieve = sieve(10_000)
  primes_4_digits = sieve.filter { |n| n.to_s.length == 4 }
  primes_4_digits.each do |n|
    prime_permutations = []
    permutations = n.to_s.split('').map(&:to_i).permutation.to_a

    permutations.each do |p|
      permutation = p.join('').to_i
      if primes_4_digits.include?(permutation)
        prime_permutations << permutation 
      end
    end

    prime_permutations.sort!.uniq!

    # Skip impossible answers
    if prime_permutations.length <= 2
      next
    end

    # Array of differences for each prime permutation
    for i in 0...(prime_permutations.length)
      d = []
      prime_permutations.each do |num|
        if num == prime_permutations[i]
          next
        end

        d << num - prime_permutations[i]
      end
  
      # p "#{n} #{prime_permutations} #{d}"
  
      d.each do |diff|
        if diff == d[i]
          next
        end
        prime_permutations.each do |num|
          if num == prime_permutations[i]
            next
          end
  
          third_num = num + diff
          if prime_permutations.include?(third_num) && (prime_permutations[i] + diff == num)
            seq << [prime_permutations[i], num, third_num]
            increment << diff
          end
        end
      end
    end
  end

  ans = seq.uniq![-1].sort
  p ans
  puts ans.reduce("") { |str, num|
    str << num.to_s
    str
  }

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# [2969, 6299, 9629]
# 296962999629
# Problem computed in 0.22735142700003053s