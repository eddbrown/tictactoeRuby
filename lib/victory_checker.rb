class Victory_checker

  attr_accessor :status

  def initialize
    @status
  end

  def check(grid)
    check_in_play(grid)
    check_draw(grid)
    [:x,:o].each{|piece| check_all(grid, piece)}
    return @status
  end

  def check_all(grid, piece)
    check_horizontal(grid,piece)
    check_vertical(grid,piece)
    check_diagonal(grid, piece)
  end

  def check_horizontal(grid, piece)
    (0..2).each do |row|
      victory(piece) if grid[row].uniq.length == 1 && grid[row][0] == piece
    end
  end

  def check_vertical(grid, piece)
    (0..2).each do |column|
      victory(piece) if (0..2).map{|row| grid[row][column]}.uniq == [piece]
    end
  end

  def check_diagonal(grid, piece)
    victory(piece) if (0..2).map{|x| grid[x][x]}.uniq == [piece]
    victory(piece) if (0..2).map{|x| grid[2 - x][x]}.uniq == [piece]
  end

  def victory(piece)
    @status = (piece.to_s + '_victory').to_sym
  end

  def check_draw(grid)
    @status = :draw if !grid.flatten.include? nil
  end

  def check_in_play(grid)
    @status = :in_play if grid.flatten.include? nil
  end
end