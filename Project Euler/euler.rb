# Collection of methods in solving Euler problems
module Euler
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

  def sieve(n)
    # Create list of prime numbers up to n
    # Array of true values, indexed by integers 2 to n
    range = Array.new(n + 1, true)
    range[0] = false
    range[1] = false

    (2..(n / 2)).each do |i|
      next unless range[i] == true

      counter = 0
      while (i**2 + (i * counter)) <= n
        range[i**2 + (i * counter)] = false
        counter += 1
      end
    end

    list_of_primes = []
    range.each_with_index do |bool, idx|
      list_of_primes << idx if bool
    end
    list_of_primes
  end

  def is_prime_simple?(number)
    # O(sqrt(N))
    return false if number < 2
    return true if [2, 3].include?(number)

    (2...Math.sqrt(number)).each do |num|
      return false if (num % 10).zero?
    end
    true
  end

  def gcd(a, b)
    # Greatest common divisor
    # Long division method
    # Largest number divided by the next largest;
    # Acuired number divided by the remainder of the previous;
    # And so on until the remainder is zero.
    # When remainder is zero, the divisor is the GCD
    return b if a.zero?

    gcd(b % a, a)
  end

  def find_divisors(num)
    # Returns divisors of a number excluding itself
    divisors = [1]
    i = 2
    while i <= Math.sqrt(num)
      divisors << i << (num / i) if (num % i).zero? # Add both numbers if evenly divides
      i += 1
    end

    divisors.uniq
  end

  def relatively_primes(num)
    # Returns array of integers less than n that are coprime to n.
    # Two integers are coprime if the only positive integer that is a divisor
    # of both is 1.
    relatively_prime = []

    (1...num).each do |n|
      relatively_prime << n if gcd(n, num) == 1
    end

    relatively_prime
  end

  def factorial(n)
    if n < 2
      1
    else
      n * factorial(n - 1)
    end
  end

  def permutation?(num1, num2)
    num1.to_s.split('').sort == num2.to_s.split('').sort
  end

  def combinatorics(n, r)
    num = factorial(n)
    den = factorial(r) * factorial(n - r)
    num / den
  end

  def sum_of_digits(num)
    array = num.to_s.split('')
    array.reduce(0) { |acc, n| acc + n.to_i }
  end

  def reverse_num(num)
    num.to_s.reverse.to_i
  end

  def num_reversible?(num)
    # Check if 0 in ones place
    return false if (num % 10).zero?

    rev = reverse_num(num)
    sum = rev + num

    # Check all digits in sum odd?
    while sum > 1
      return false if sum.to_s[-1].to_i.even? # check every digit place if even

      sum /= 10
    end

    true
  end

  def gen_seq_of_pentagon_numbers(n)
    arr = []
    (1..n).each do |i|
      arr << i * (3 * i - 1) / 2
    end
    arr
  end

  def gen_seq_of_triangle_numbers(n)
    arr = []
    (1..n).each do |i|
      arr << ((i + 1) * 0.5 * i).to_i
    end
    arr
  end

  def gen_seq_of_hexagon_numbers(n)
    arr = []
    (1..n).each do |i|
      arr << i * (2 * i - 1)
    end
    arr
  end

  def palindrome?(num)
    num.to_s.reverse == num.to_s
  end

  def palindrome(num)
    num.to_s.reverse.to_i
  end

  def max_path_sum(matrix, m, n)
    # Goal points: m, n
    # Analysis:
    # From a cell (i, j), you can only traverse:
    # down (i + 1, j)
    # right diagonal (i + 1, j + 1)

    # Bottom-up calculation:
    # Traverse each row starting at the second-to-the-last row
    # For each non-zero element, check elements below and right diagonal to them
    # Add the max to said element
    (0...(m - 1)).reverse_each do |r|
      (0..n).each do |c|
        break if matrix[r][c].zero?

        matrix[r][c] += [matrix[r + 1][c], matrix[r + 1][c + 1]].max
      end
    end

    # Return point (0, 0) which stores the max sum
    matrix[0][0]
  end

  def number_to_array(num)
    num.to_s.split('').map(&:to_i)
  end
end
