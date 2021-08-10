# Problem Statement
# If the numbers 1 to 5 are written out in words:
# one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19
# letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive
# were written out in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens.
# For example, 342 (three hundred and forty-two) contains 23 letters
# and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance
# with British usage.

def in_words(int)
  # Works for 1 - 1000

  word = {
    1000 => 'thousand',
    100 => 'hundred',
    90 => 'ninety',
    80 => 'eighty',
    70 => 'seventy',
    60 => 'sixty',
    50 => 'fifty',
    40 => 'forty',
    30 => 'thirty',
    20 => 'twenty',
    19 => 'nineteen',
    18 => 'eighteen',
    17 => 'seventeen',
    16 => 'sixteen',
    15 => 'fifteen',
    14 => 'fourteen',
    13 => 'thirteen',
    12 => 'twelve',
    11 => 'eleven',
    10 => 'ten',
    9 => 'nine',
    8 => 'eight',
    7 => 'seven',
    6 => 'six',
    5 => 'five',
    4 => 'four',
    3 => 'three',
    2 => 'two',
    1 => 'one'
  }

  str = ''
  length = int.to_s.length
  left_digit = int.to_s[0].to_i

  # Hundreds
  if length >= 3
    str << word[left_digit]
    str << word[10**(length - 1)]
    int = int.to_s[1..].to_i
    length -= 1
    left_digit = int.to_s[0].to_i
    return str if int.zero?
  end

  # 2 digits
  if length == 2
    str << 'and' if str != ''

    if int > 20
      str << word[left_digit * 10]
      int -= left_digit * 10
    end

    str << word[int] if int.between?(1, 20)
  end

  # 1 digit
  str << word[int] if length == 1

  str
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  letter_count = 0
  (1..1000).each do |num|
    letter_count += in_words(num).length
  end

  p letter_count

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 21124
# Problem computed in 0.006739564999406866s
