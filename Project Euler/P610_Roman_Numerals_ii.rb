# A random generator produces a sequence of symbols drawn from the set {I, V, X, L, C, D, M, #}.
# Each item in the sequence is determined by selecting one of these symbols at random,
# independently of the other items in the sequence. At each step, the seven letters are equally likely to be selected,
#  with probability 14% each, but the # symbol only has a 2% chance of selection.

# We write down the sequence of letters from left to right as they are generated,
# and we stop at the first occurrence of the # symbol (without writing it).
# However, we stipulate that what we have written down must always (when non-empty) be a valid Roman numeral representation
#  in minimal form. If appending the next letter would contravene this then we simply skip it and try again
# with the next symbol generated.

# Please take careful note of About... Roman Numerals for the definitive rules for this problem on what
# constitutes a "valid Roman numeral representation" and "minimal form". For example,
# the (only) sequence that represents 49 is XLIX. The subtractive combination IL is invalid because of rule (ii),
#  while XXXXIX is valid but not minimal. The rules do not place any restriction on the number of occurrences of M,
# so all positive integers have a valid representation.
# These are the same rules as were used in Problem 89, and members are invited to solve that problem first.

# Find the expected value of the number represented by what we have written down when we stop.
# (If nothing is written down then count that as zero.) Give your answer rounded to 8 places after the decimal point.

require 'debug'
require_relative 'modules/timer'
require_relative 'modules/romans'

# UNFINISHED/Wrong Answer
class P610
  include Romans
  include Timer

  SET = %w[I V X L C D M #].freeze
  PROBABILITY = { 'I' => 0.14, 'V' => 0.14, 'X' => 0.14, 'L' => 0.14, 'C' => 0.14, 'D' => 0.14, 'M' => 0.14,
                  '#' => 0.02 }.freeze

  def initialize
    @expected_val = 0.0

    time_execution do
      solve
      print_answer
    end
  end

  def solve
    (1..100_000).each do |value|
      roman = int_to_roman(value)
      @expected_val += (calculate_prob(roman) * value)
    end
  end

  def calculate_prob(str)
    # reduce func already includes 0.02 probability
    str.split('').reduce(0.02) do |product, element|
      product * P610::PROBABILITY[element]
    end
  end

  def print_answer
    puts @expected_val.round(8)
  end
end

P610.new
# wrong:
# 15.77314774
# Problem computed in 4.410778000001301s (100_000)
# 15.77314774
# Problem computed in 75.78365699999995s (1_000_000)
