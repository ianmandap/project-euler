# Problem Statement
# A googol (10**100) is a massive number: one followed by one-hundred zeros; 
# 100**100 is almost unimaginably large: one followed by two-hundred zeros. 
# Despite their size, the sum of the digits in each number is only 1.
# Considering natural numbers of the form, ab, where a, b < 100, 
# what is the maximum digital sum?

def sum_of_digits(num)
  array = num.to_s.split('')
  array.reduce(0) {|acc, num| acc + num.to_i}
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  max_sum = 0

  for a in 2..99
    for b in 2..99
      num = a**b
      sum = sum_of_digits(num)
      if sum > max_sum
        max_sum = sum
        max_num = num
        a_val = a
        b_val = b
      end
    end
  end

  print "Considering natural numbers of the form, ab, where a, b < 100, "
  print "the maximum digital sum is #{max_sum}; num = #{a_val}**#{b_val} = #{max_num} \n"
  
  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 972
# 0.21483593199991446s