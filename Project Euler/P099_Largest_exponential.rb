# Problem Statement
# Comparing two numbers written in index form like 211 and 37 is not difficult,
# as any calculator would confirm that 211 = 2048 < 37 = 2187.
# However, confirming that 632382**518061 > 519432**525806 would be much more difficult,
# as both numbers contain over three million digits.
# Using base_exp.txt (right click and 'Save Link/Target As...'),
# a 22K text file containing one thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.
# NOTE: The first two lines in the file represent the numbers in the example given above.

require_relative 'euler'
include Euler

def line_to_array(line)
  line.split(',').map(&:to_i)
end

def log_digits(base, exp)
  exp * Math.log10(base)
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  file_name = '~/AvionSchool/ruby_portfolio/Project Euler/assets/p099_base_exp.txt'
  file = File.open(File.expand_path(file_name))

  # Manually compare each line with each other using base 10 log
  # to approximate number of digits a number is
  max = [[1, 1], 0] # Store pair and index
  file.each do |line|
    line = line_to_array(line) # e.g. [13846, 7266]
    current_num = max[0]

    max = [line, file.lineno] if log_digits(line[0], line[1]) > log_digits(current_num[0], current_num[1])
  end
  file.close

  p max
  p max[-1]

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# [[895447, 504922], 709]
# 709
# Problem computed in 0.004573763999360381s
