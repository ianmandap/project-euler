# Problem Statement
# An integer of the form p^q q^p with prime numbers p \neq q is called a hybrid-integer
# For example, 800 = 2^5 5^2 is a hybrid-integer.
# We define C(n) to be the number of hybrid-integers less than or equal to n.
# You are given C(800) = 2 and $C(800^{800}) = 10790.
# Find $C(800800^{800800}).
require_relative 'euler'
require 'byebug'

class P800
  include Euler
  attr_accessor :list, :n, :primes, :count

  def initialize(n)
    @n = n
    @count = 0
    @primes = sieve(n / 2)
  end

  def solve
    @primes.combination(2) do |num1, num2|
      next if num1 == num2
      next if num1 * num2 > n

      num = num1**num2 * num2**num1
      @count += 1 if num <= n
    end

    print_answer
  end

  def print_answer
    p "C(#{n}) = #{@count}"
  end
end

P800.new(800).solve #=> 2
# NOTETOSELF: even 800^800 is impossibly big to sieve for primes and to brute force
# Need to find a better way
