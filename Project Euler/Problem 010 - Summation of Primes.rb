# Problem Statement:
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
sum = 0

# Applying Sieve of Erathosthenes
# Marks as composite the multiples of each prime starting with 2
def sieve(n)
  # Array of true values, indexed by integers 2 to n
  range = Array.new(n+1, true)
  range[0], range[1] = false, false
  p = 2

  for i in (2..(n/2))
    if range[i] == true
      counter = 0
      while (i**2 + (i * counter)) <= n
        range[i**2 + (i * counter)] = false
        counter += 1
      end
    end
  end
  
  list_of_primes = [] 
  range.each_with_index {|bool, idx|
    list_of_primes << idx if bool
  }
  list_of_primes.reduce(0) {|acc,num| acc+num}
end

p "The sum of all primes below two million is: #{sieve(2000000)}" #=> 142913828922