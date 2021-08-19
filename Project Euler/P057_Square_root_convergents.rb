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

def initial_main
  # Using Ruby's Float class and the built-in #rationalize method.
  # Float numbers will become inaccurate and reach a decimal limit
  # starting at the 19-20th iteration and so will always produce the
  # same float after each iteration
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  ans = 0
  iterations = 25

  (1..iterations).each do |i|
    n = (1 + square_root_convergence_decimal(i)).rationalize
    ans += 1 if n.numerator.to_s.length > n.denominator.to_s.length
  end

  p ans

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

def main
  # Implentation using tuple assignment
  # Compute int numerator and int denominator w/o evaluating float
  # Expands numerator to 2d + n
  # Expands denominator to n + d
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  num = 3 # starting at 1st iteration
  den = 2
  iterations = 1_000
  count = 0

  (2..iterations).each do |_|
    num, den = (num + 2 * den), (num + den)
    # Using log10 is faster than converting int to str and comparing length
    # log10 returns the base which fulfills 10 ** number
    # Round down bases to integers to compare
    count += 1 if Math.log10(num).to_i > Math.log10(den).to_i
  end

  p count

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 153
# Problem computed in 0.002855095000086294s