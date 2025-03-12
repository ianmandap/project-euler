# Problem Statement
# For the year $2025
# 2025 = (20 + 25)^2
# Given positive integers a and b, the concatenation ab we call a 2025-number if ab = (a+b)^2
# Other examples are 3025 and 81
# Note 9801 is not a 2025-number because the concatenation of 98 and 1 is 981.

# Let T(n) be the sum of all 2025-numbers with n digits or less.
# You are given T(4) = 5131
# Find T(16)

require 'byebug'
require_relative 'modules/timer'

class P932
  include Timer
  attr_accessor :list

  def initialize(digits)
    @list = []
    @digits = digits
    @max_num = Array.new(digits, '9').join('').to_i

    time_execution do
      solve
      print_answer
    end
  end

  def half_str(str)
    half = str.size / 2.to_f.ceil

    x = str[0...half]
    y = str[half..]

    [x.to_i, y.to_i]
  end

  def solve
    # iterate through squared numbers less than the max number
    # written another way: sqrt(ab) = a + b
    # 9 is start of first 2025-number (81)
    max = Math.sqrt(@max_num).to_i

    (9..max).each do |num|
      puts_percentage(num, max)
      square = num**2

      x, y = half_str(square.to_s)
      @list << square if num == x + y && square.to_s == [x, y].join('')
    end
  end

  def print_answer
    p "T(#{@digits}) = #{@list.sum}"
  end
end

# P932.new(4) #=> 5131 [81, 2025, 3025]
P932.new(16)
# "T(16) = [REDACTED]"
# Problem computed in 331.6096370000014s
