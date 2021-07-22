# Problem Statement
# The fraction 49/98 is a curious fraction, in attempting to simplify it we may incorrectly 
# believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# There are exactly four non-trivial examples of this type of fraction, 
# less than one in value, and containing two digits in the numerator and denominator.

# If the product of these four fractions is given in its lowest common terms, 
# find the value of the denominator.


def is_cancelling_fraction?(num, den)
  intersection = (num.to_s.split('') & den.to_s.split('')).join
  return false if intersection == "0" || intersection.length != 1

  simp_num = num.to_s.sub(intersection,"").to_f
  simp_den = den.to_s.sub(intersection,"").to_f
  simp_value = simp_num.to_f/simp_den
  
  value = num.to_f/den
  if simp_value == value
    return true
  else
    return false
  end
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  cancelling_array = []
  num = 1
  den = 1
  for i in 11..99
    for j in 11..99
      next if i >= j
      if is_cancelling_fraction?(i, j)
        cancelling_array << [i, j]
        num *= i
        den *= j
      end
    end
  end

  gcd = num.gcd(den)
  p "The value of the denominator in the problem is #{den/gcd}"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 100
# Problem computed in 0.00875439700030256s