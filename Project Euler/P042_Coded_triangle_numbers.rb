# Problem Statement
# The nth term of the sequence of triangle numbers is given by, 
# tn = ½n(n+1); so the first ten triangle numbers are:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its alphabetical position 
# and adding these values we form a word value. For example, the word value for 
# SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall 
# call the word a triangle word.

# Using words.txt, a text file containing nearly two-thousand common English words, 
# how many are triangle words?

def alphabetical_value(string)
  string.upcase!
  arr = string.split('')
  arr.reduce(0) {|sum, chr| sum + (chr.ord - 64)}
end

def gen_seq_of_triangle_numbers(n)
  arr = []
  for i in 1..n
    arr << ((i+1)*0.5*i).to_i
  end
  arr
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  file_name  = "~/AvionSchool/ruby_portfolio/Project Euler/assets/p042_words.txt"
  file = File.open(File.expand_path(file_name))

  # Transform Data into Array
  file_content = file.read.split('","')
  file_content[0] = file_content[0].gsub('"',"")
  file_content[-1] = file_content[-1].gsub('"',"")
  file.close

  # Longest English word Pneumonoultramicroscopicsilicovolcanoconiosis has value of 560
  # Limit array to n = 33 (561 max)
  arr_triangle_numbers = gen_seq_of_triangle_numbers(33)
  triangle_words = []
  
  # Test each word in file
  file_content.each {|word|
    value = alphabetical_value(word)
    if arr_triangle_numbers.include?(value)
      triangle_words << word
    end
  }

  p triangle_words
  print "In the file are #{triangle_words.length} triangle words. \n"

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# In the file are 162 triangle words
# Problem computed in 0.0045864839999012474s