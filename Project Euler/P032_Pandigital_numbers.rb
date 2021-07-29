# Problem Statement
# We shall say that an n-digit number is pandigital if it makes use of all the digits 
# 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, 
# multiplier, and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can be 
# written as a 1 through 9 pandigital.
# HINT: Some products can be obtained in more than one way so be sure to only 
# include it once in your sum.


def is_pandigital?(array_3_elements)
  str = array_3_elements.join('').chars.sort.join
  str == '123456789' ? true : false
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  pandigitals_products = []

  # brute force
  for i in 1..9876
    for j in 1..((9876/i+1).to_i) # Ensure operations that result in 9 digit totals
      next if i >= j
      product = i*j
      if is_pandigital?([product, i, j])
        pandigitals_products << product
      end
    end
  end

  pandigitals_products.uniq!
  p pandigitals_products.reduce(&:+)
  
  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 45228
# 0.13992909499938833s