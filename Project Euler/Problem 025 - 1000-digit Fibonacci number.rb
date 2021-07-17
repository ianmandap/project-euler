# Problem Statement
# 1,1,2,3,5,8,13,21,34,55,89,144
# The 12th term, 144, is the first term to contain three digits.
# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

arr = [1,1,2,3,5,8,13,21,34,55,89,144]
index = 12
answer_found = false

until answer_found
  old_term = arr[-2]
  new_term = arr[-1]
  num = old_term + new_term
  arr << num

  if num.to_s.length >= 1000
    answer_found = true
    p num
  end

  index += 1
end

p "The index of the first term in the Fibonacci sequence to contain 1000 digits? is #{index}" #=> 4782