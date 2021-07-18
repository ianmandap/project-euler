# Problem Statement
# The series, 1**1 + 2**2 + 3**3 + ... + 10**10 = 10405071317.
# Find the last ten digits of the series, 1**1 + 2**2 + 3**3 + ... + 1000**1000.

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  sum = 0
  for i in 1..1000
    sum += i**i
  end
  
  length_10 = sum.to_s[-10..-1]
  print "The last ten digits of the series, 1**1 + 2**2 + 3**3 + ... + 1000**1000 is: #{length_10} \n"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
#=> 9110846700
# 0.007928555998660158s