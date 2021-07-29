# Problem Statement
# If p is the perimeter of a right angle triangle with integral 
# length sides, {a,b,c}, there are exactly three solutions for p = 120.
# {20,48,52}, {24,45,51}, {30,40,50}
# For which value of p ≤ 1000, is the number of solutions maximised?

def gen_right_triangles_given_perimeter(perimeter)
  solutions = []

  for b in 2..(perimeter/2)
    for h in 2..(perimeter/2)
      next if b > h
      d = ((b**2 + h**2)**0.5)
      if (b+h+d) == perimeter.to_f
        solutions << [b,h,d.to_i]
      end
    end
  end
  solutions
end

def main
  start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  max_no_solutions = 0

  for p in 120..1000
    current_solutions = gen_right_triangles_given_perimeter(p)
    if current_solutions.length > max_no_solutions
      max_p = p
      max_solutions = current_solutions
      max_no_solutions = max_solutions.length
    end
  end

  print "The maximum number of solutions is given by p = #{max_p} "
  print ": #{max_no_solutions} solutions \n" 
  p max_solutions

  finish_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  @runtime = finish_time - start_time
  puts "Problem computed in #{@runtime}s"
end

main
# The maximum number of solutions is given by p = 840 : 8 solutions 
# [[40, 399, 401], [56, 390, 394], [105, 360, 375], [120, 350, 370], [140, 336, 364], [168, 315, 357], [210, 280, 350], [240, 252, 348]]
# Problem computed in 11.260176924999996s