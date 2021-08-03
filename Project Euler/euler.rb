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

  def factorial(n)
    (1..n).reduce(1) {|prod, num| prod*num}
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
    array.reduce(0) {|acc, num| acc + num.to_i}
  end

  def reverse_num(num)
    num.to_s.reverse.to_i
  end

  def num_reversible?(num)
    # Check if 0 in ones place
    return false if num % 10 == 0
  
    rev = reverse_num(num)
    sum = rev + num
  
    # Check all digits in sum odd?
    while sum > 1
      return false if sum.to_s[-1].to_i.even? # check every digit place if even
      sum /= 10
    end
  
    return true
  end

  def gen_seq_of_pentagon_numbers(n)
    arr = []
    for i in 1..n
      arr << i*(3*i-1)/2
    end
    arr
  end

  def gen_seq_of_triangle_numbers(n)
    arr = []
    for i in 1..n
      arr << ((i+1)*0.5*i).to_i
    end
    arr
  end

  def gen_seq_of_hexagon_numbers(n)
    arr = []
    for i in 1..n
      arr << i*(2*i - 1)
    end
    arr
  end
end