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

  def valid_minimal_roman?(str)
    # Inefficient checking
    int_rep = roman_to_int(str)
    str == int_to_roman(int_rep)
  end
end
