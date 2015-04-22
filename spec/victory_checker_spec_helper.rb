def fill_in_draw
  grid[0][1] = :x
  grid[0][0] = :x
  grid[2][0] = :x
  grid[2][1] = :x
  grid[1][2] = :x

  grid[1][0] = :o
  grid[1][1] = :o
  grid[2][2] = :o
  grid[0][2] = :o
end
