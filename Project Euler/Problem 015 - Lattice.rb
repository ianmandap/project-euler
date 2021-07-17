# Problem Statement
# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, 
# there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

def no_of_routes_in_grid(n)
  # Initialize 2D array
  grid = Array.new(n+1) {Array.new(n+1)}
  
  # Starting from the lower left point, work way towards the upper right point
  # Numbering each point along the way = the no. of possible ways to get to it
  # Essentially, this gives us Pascal's Triangle turned on its side

  # E.g. in a 3x3 grid
  # 01 01 01 01
  # 01 02 03 04
  # 01 03 06 10
  # 01 04 10 20

  # Plot row AND column of index 0
  for r in 0..n
    grid[0][r] = 1 # rows
    grid[r][0] = 1 # columns
  end

  # Plot per row
  # Add value of point on the west and north
  for r in 1..n
    for c in 1..n
      grid[r][c] = grid[r-1][c] + grid[r][c-1]
    end
  end

  p grid
  grid[n][n]
end

p no_of_routes_in_grid(2)
p no_of_routes_in_grid(3)
p no_of_routes_in_grid(4)
p no_of_routes_in_grid(20) #=> 137846528820