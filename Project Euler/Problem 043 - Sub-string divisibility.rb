# Problem Statement
# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of 
# each of the digits 0 to 9 in some order, but it also has a rather interesting 
# sub-string divisibility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. 
# In this way, we note the following:

#     d2d3d4=406 is divisible by 2
#     d3d4d5=063 is divisible by 3
#     d4d5d6=635 is divisible by 5
#     d5d6d7=357 is divisible by 7
#     d6d7d8=572 is divisible by 11
#     d7d8d9=728 is divisible by 13
#     d8d9d10=289 is divisible by 17

# Find the sum of all 0 to 9 pandigital numbers with this property.

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  arr_pandigitals = [0,1,2,3,4,5,6,7,8,9].permutation.to_a
  arr_pandigitals_divis_substr = []

  arr_pandigitals.each {|a|
    next if a[0] == 0
    next unless a[3].even?                  # divisibility by 2
    next unless a[2..4].join.to_i % 3 == 0  # divisibility by 3
    next unless [0,5].include?(a[5])        # divisibility by 5
    next unless a[4..6].join.to_i % 7 == 0  # divisibility by 7
    next unless a[5..7].join.to_i % 11 == 0 # divisibility by 11
    next unless a[6..8].join.to_i % 13 == 0 # divisibility by 13
    next unless a[7..9].join.to_i % 17 == 0 # divisibility by 17
    arr_pandigitals_divis_substr << a.join.to_i
  }

  print "The sum of all 0-9 pandigitals with the above property is "
  print "#{arr_pandigitals_divis_substr.reduce(&:+)} \n"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# The sum of all 0-9 pandigitals with the above property is 16695334890 
# Problem computed in 3.750874271999919s