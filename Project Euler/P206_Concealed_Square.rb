# Problem Statement
# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

def p206_form?(num)
  # check if num in the form of 1_2_3_4_5_6_7_8_9_0
  array = num.to_s.split('')
  array.each_with_index.reduce([]) {|arr, (num, idx)|
    arr << num.to_i if idx.even?
    arr
  } == [1,2,3,4,5,6,7,8,9,0] ? true : false
end

# p p206_form?(1121314151617181980) # true

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  arr = [1,2,3,4,5,6,7,8,9,0]
  # Establish limit
  # Number is between:
  num_floor = Math.sqrt(arr.join("0").to_i).to_i
  num_ceiling = Math.sqrt(arr.join("9").to_i).to_i

  ans = 0
  # Test each num from floor to ceiling
  # Test numbers only if divisible by 10 since the square's last digit is 0
  for num in (num_floor..num_ceiling).reverse_each
    next unless num % 10 == 0
    sqr = num**2
    if p206_form?(sqr)
      ans = num
      break
    end
  end

  print "The number is #{ans} with a square in the form of #{ans*ans} \n"
  
  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# The number is 1389019170 with a square in the form of 1929374254627488900 
# Problem computed in 11.437107887999446s