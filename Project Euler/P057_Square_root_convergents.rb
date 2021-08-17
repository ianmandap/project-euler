# Problem Statement
# It is possible to show that the square root of two
# can be expressed as an infinite continued fraction.

# ruby_portfolio/Project Euler/assets/p057_screenshot1.png

# By expanding this for the first four iterations, we get:

# ruby_portfolio/Project Euler/assets/p057_screenshot2.png

# The next three expansions are (99 / 70), (239 / 169), (577 / 408),
# but the eighth expansion, (1393 / 985) is the first example
# where the number of digits in the numerator exceeds
# the number of digits in the denominator.

# In the first one-thousand expansions, how many fractions contain a
# numerator with more digits than the denominator?

def square_root_convergence_decimal(num)
  # Compute decimal portion through recursion
  return 0.5 if num == 1

  1 / (2 + square_root_convergence_decimal(num - 1))
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  ans = 0
  iterations = 1_000

  (1..8).each do |i|
    n = (1 + square_root_convergence_decimal(i)).rationalize
    ans += 1 if n.numerator.to_s.length > n.denominator.to_s.length
  end

  p ans

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

# main

a1 = (1 + square_root_convergence_decimal(100))
a2 = (1 + square_root_convergence_decimal(1000))

p a1
p a2