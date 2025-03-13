# Problem Statement
# We define an S-number to be a natural number n, that is a perfect square
# and its square root can be obtained by splitting the decimal representation of n
# into or 2 more numbers then adding the numbers.

# Example: 81 is an S-number because sqrt(81) = 8 + 1
# 6724 is an S-number because sqrt(6724) = 6 + 72 + 4
# 8281 is an S-number because sqrt(8281) = 82 + 8 + 1
# 9801 is an S-number because sqrt(9801) = 98 + 0 + 1

# Further we define T(N) to be the sum of all S numbers n <= N.
# You are given T(10**4) = 41333
# Find T(10**12)

require 'byebug'
require_relative 'modules/timer'

class P719
  include Timer
  attr_accessor :list

  def initialize(base, exp)
    @list = []
    @base = base
    @exp = exp
    @max_number = Math.sqrt((base**exp))

    time_execution do
      solve
      print_answer
    end
  end

  def s_number?(num, squared)
    # recursively check if digits inside squared equals num

    # base case
    return false if squared < num
    return true if squared == num

    # split with increasing divmod and recursively check
    # if equal by subtracting
    t = 10
    while t < squared
      left, right = squared.divmod(t)
      return true if left <= num && s_number?(num - left, right)

      t *= 10
    end

    # not reached
    false
  end

  def solve
    (9..@max_number).each do |num|
      squared = num**2
      next unless [0, 1].include?(num % 9)

      puts_percentage(num, @max_number)

      @list << squared if s_number?(num, squared)
    end
  end

  def print_answer
    p "T(#{@base}**#{@exp}) = #{@list.sum}"
  end
end

# P719.new(10, 4) #=> 41333
P719.new(10, 12)
# "T(10**12) = [REDACTED]"
# Problem computed in 5.8077809999995225s
