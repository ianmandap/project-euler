# For a number written in Roman numerals to be considered valid there are basic rules which must be followed.
# Even though the rules allow some numbers to be expressed in more than one way there is always a "best" way of
# writing a particular number.

# For example, it would appear that there are at least six ways of writing the number sixteen:

# IIIIIIIIIIIIIIII
# VIIIIIIIIIII
# VVIIIIII
# XIIIIII
# VVVI
# XVI

# However, according to the rules only XIIIIII and XVI are valid,
# and the last example is considered to be the most efficient, as it uses the least number of numerals.

# The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
# contains one thousand numbers written in valid, but not necessarily minimal, Roman numerals;
#  see About... Roman Numerals for the definitive rules for this problem.

# Find the number of characters saved by writing each of these in their minimal form.
# Note: You can assume that all the Roman numerals in the file contain no more than four consecutive identical units.

require 'debug'
require_relative 'modules/timer'
require 'active_support'
require 'active_support/core_ext/hash/indifferent_access'

module Romans
  ROMANS_HASH =
    { 'M' => 1000,
      'CM' => 900,
      'D' => 500,
      'CD' => 400,
      'C' => 100,
      'XC' => 90,
      'L' => 50,
      'XL' => 40,
      'X' => 10,
      'IX' => 9,
      'V' => 5,
      'IV' => 4,
      'I' => 1 }.with_indifferent_access

  def roman_to_int(str)
    arr = str.split('')
    value = 0

    arr.each_with_index do |e, idx|
      # check if already computed
      left_str = if idx.zero?
                   nil
                 else
                   (arr[idx - 1] + arr[idx])
                 end
      left_value = ROMANS_HASH[left_str]

      next unless left_value.nil?

      current_str = arr[idx] + (arr[idx + 1] || '') # coerce idx beyond last to empty string
      value += if ROMANS_HASH[current_str].nil?
                 ROMANS_HASH[e]
               else
                 ROMANS_HASH[current_str]
               end
    end
    value
  end

  def int_to_roman(int)
    roman = ''
    num = int

    ROMANS_HASH.each do |symbol, value|
      while num >= value
        roman << symbol
        num -= value
      end
    end

    roman
  end
end

class P809
  include Timer
  include Romans

  def initialize
    @original_len = 0
    @minimal_len = 0
    @romans_arr = []
    @int_arr = []

    time_execution do
      solve
      print_answer
    end
  end

  def solve
    file = File.open(File.expand_path('./Project Euler/assets/p089_roman.txt'))
    file.each do |line|
      roman_num = line.chomp
      @original_len += roman_num.length

      roman_int_value = roman_to_int(roman_num)
      minimal_roman = int_to_roman(roman_int_value)
      @minimal_len += minimal_roman.length
    end
  end

  def print_answer
    p @original_len - @minimal_len
  end
end

P809.new
# Problem computed in 0.010640000000421423s
