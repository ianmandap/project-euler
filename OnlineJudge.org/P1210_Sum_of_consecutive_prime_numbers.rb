# https://onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&category=247&page=show_problem&problem=3651

# Problem Statement:
# Some positive integers can be represented by a sum of one or more consecutive prime numbers. How
# many such representations does a given positive integer have? For example, the integer 53 has two
# representations 5+7+11+13+17 and 53. The integer 41 has three representations 2+3+5+7+11+13,
# 11 + 13 + 17, and 41. The integer 3 has only one representation, which is 3. The integer 20 has no
# such representations. Note that summands must be consecutive prime numbers, so neither 7 + 13 nor
# 3+5+5+7 is a valid representation for the integer 20. Write a program that reports
# the number of representations for the given positive integer.

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

def main(input)
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  # Initialize primes
  sieve = sieve(10_000)

  # Test each number
  arr = input.split(/\r?\n/).map(&:to_i)
  arr.each do |num|
    reps = 0
    limit = num

    # Find out max counter limit that sums to target limit
    counter_limit = 1
    extracted_array = sieve[0..counter_limit]
    while extracted_array.reduce(&:+) < limit
      counter_limit += 1
      extracted_array = sieve[0..counter_limit]
    end

    # If num is prime:
    # Modify max counter to check until index of prime so it can count representations
    # that only contain itself
    counter_limit = sieve.index(num) if sieve.include?(num)

    # Iterate through sieve and extract Array ranges to test
    for i in 0..counter_limit
      for j in 0..counter_limit
        next if i > j # Avoid invalid ranges

        test_array = sieve[i..j]
        sum = test_array.reduce(&:+)
        next if sum > limit
        if sum == limit
          reps += 1
        end
      end
    end

    # Print no. of representations
    p reps unless num.zero?
  end

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

input = "2\n3\n17\n41\n20\n666\n12\n53\n0"
main(input)
