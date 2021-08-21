# Problem Statement:
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4,
# but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?

require 'date'

def main
  # Using DateTime object
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  count = 0

  (1901..2000).each do |year|
    (1..12).each do |month|
      count += 1 if Date.new(year, month, 1).wday.zero?
    end
  end

  p count

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 171
# Problem computed in 0.0007454669998878671s

def is_leap_year?(year)
  (year % 4).zero? && (year % 100 != 0 || (year % 400).zero?)
end

def main_no_date
  # Using no date object
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  count = 0
  day = 1 # January 1, 1900 is a Monday
  months_non_leap = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  months_leap =     [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  (1900..2000).each do |year|
    (0...12).each do |j|
      day += case is_leap_year?(year)
             when true
               months_leap[j] % 7
             else
               months_non_leap[j] % 7
             end
      count += 1 if year > 1900 && (day % 7).zero?
    end
  end

  p count

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main_no_date
# 171
# Problem computed in 0.00021986799993101158s
