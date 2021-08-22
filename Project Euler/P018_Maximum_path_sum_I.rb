# Problem Statement
# By starting at the top of the triangle below and moving to adjacent numbers
# on the row below, the maximum total from top to bottom is 23.

# 3
# 7 4
# 2 4 6
# 8 5 9 3

# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom of the triangle in p018_triangle.txt

require_relative 'euler'
include Euler
# Import max_path_sum function

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  file_name = '~/AvionSchool/ruby_portfolio/Project Euler/assets/p018_triangle.txt'
  file = File.open(File.expand_path(file_name))

  # Transform Data into Array
  # Instead of loading the whole file into memory, reads line-by-line using IO
  data = []
  IO.foreach(file) { |line| data << line.split(' ').map(&:to_i) }
  file.close

  # Transform Array into a Regular Matrix by filling empty positions with 0
  max_length = data[-1].length
  data.each { |arr| arr << 0 while arr.length < max_length }

  # Compute max path sum
  p max_path_sum(data, data.length, data.length)

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 1074
# Problem computed in 0.00010837699937837897s
