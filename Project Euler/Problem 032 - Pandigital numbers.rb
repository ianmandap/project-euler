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