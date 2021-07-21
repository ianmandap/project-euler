# Problem Statement
# Using names.txt begin by sorting it into alphabetical order. 
# Then working out the alphabetical value for each name, 
# multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, 
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
# So, COLIN would obtain a score of 938 × 53 = 49714.
  
#   What is the total of all the name scores in the file?

def alphabetical_value(string)
  string.upcase!
  arr = string.split('')
  arr.reduce(0) {|sum, chr| sum + (chr.ord - 64)}
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  
  file_name  = "/home/theianmilan/AvionSchool/ruby_portfolio/Project Euler/assets/p022_names.txt"
  file = File.open(file_name)

  # Transform Data into Array
  file_content = file.read.split('","')
  file_content[0] = file_content[0].gsub('"',"")
  file_content[-1] = file_content[-1].gsub('"',"")
  file.close

  file_content.sort!
  p file_content[938 - 1] === "COLIN" 

  total_sum = file_content.each_with_index.reduce(0) {|sum, (str, idx)|
    sum + (alphabetical_value(str) * (idx+1))
  }

  print "The total of all the name scores in the file is #{total_sum} \n"
  
  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# 871198282
# 0.01922479599943472s