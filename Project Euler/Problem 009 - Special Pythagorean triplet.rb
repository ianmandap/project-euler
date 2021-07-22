# Problem Statement:
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a**2 + b**2 = c**2
# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def is_perfect_square(num)
  sr = Math.sqrt(num).to_i
  sr*sr == num
end

def generate_pythagorean_triplet(goal_sum)
  array_of_triplet = []
  max_counter = goal_sum / 2
  answer_found = false

  (2..max_counter).each { |i|
    (2..max_counter).each { |j|
      if i > j
        next
      end
      
      csqr = i**2 + j**2
      if is_perfect_square(csqr) && (i + j + Math.sqrt(csqr).to_i) == goal_sum
        array_of_triplet = [i, j, Math.sqrt(csqr).to_i]
        p "found it"
        answer_found = true
        break
      end

      p "#{i}, #{j}" # see progress
    }

    if answer_found
      break
    end
  }

  array_of_triplet
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  triplet = generate_pythagorean_triplet(1000)
  p "The product of abc is #{triplet.reduce(1) {|prod, e| prod*e}}; Array: #{triplet.to_s}"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
#=> 31875000; Array: [200, 375, 425]
# 0.9965406729997994s