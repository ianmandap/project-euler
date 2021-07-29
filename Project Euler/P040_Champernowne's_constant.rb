# Problem Statement
# An irrational decimal fraction is created by concatenating the positive integers:
# 0.123456789101112131415161718192021...
# It can be seen that the 12th digit of the fractional part is 1.
# If dn represents the nth digit of the fractional part, 
# find the value of the following expression.
# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  n = "0."
  i = 1

  while n.length < 1000002
    n << i.to_s
    i += 1
  end

  ans = n[1+1].to_i * n[10+1].to_i * n[100+1].to_i * n[1000+1].to_i * n[10000+1].to_i * n[100000+1].to_i * n[1000000+1].to_i
  puts "The value of the expression is #{ans}"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# The value of the expression is 210
# Problem computed in 0.044628772000578465s