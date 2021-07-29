# Problem Statement
# Take the number 192 and multiply it by each of 1, 2, and 3:
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. 
# We will call 192384576 the concatenated product of 192 and (1,2,3)

# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, 
# giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the 
# concatenated product of an integer with (1,2, ... , n) where n > 1?

def generate_pandigital(num, array)
  str = ""
  array.each{|n|
    str << (num*n).to_s
  }

  str.to_i
end

def is_pandigital?(num)
  str = num.to_s.split('').sort.join
  str == '123456789' ? true : false
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  max_pandigital = 0
  max_integer = 0
  max_array = []

  for n in 9..9999 # up to 4 digits
    for arr in 2..9
      num = generate_pandigital(n, (1..arr))

      if is_pandigital?(num)
        if num > max_pandigital
          max_pandigital = num
          max_integer = n
          max_array = 1..arr
          break
        end
      end
    end
  end

  print "The largest 1 to 9 pandigital 9-digit number that can be formed as the "
  print "concatenated product of an integer with (1,2, ... , n) where n > 1? "
  print "is #{max_pandigital}; #{max_integer} * #{max_array.inspect} \n" 

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 932718654; 9327 * 1..2 
# Problem computed in 0.7696358209996106s