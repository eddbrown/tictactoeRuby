class VictoryChecker

  attr_accessor :status

  def initialize
    @status = :in_play
  end

  def check(grid)
    if @status == :in_play
      check_in_play(grid)
      check_draw(grid)
      [:x,:o].each{|piece| check_all(grid, piece)}
    end
    @status
  end

  def check_all(grid, piece)
    check_horizontal(grid,piece)
    check_vertical(grid,piece)
    check_leading_diagonal(grid, piece)
    check_non_leading_diagonal(grid, piece)
  end

  def check_horizontal(grid, piece)
    (0..2).each{|row| victory(piece) if grid[row].uniq.length == 1 && grid[row][0] == piece}
  end

  def check_vertical(grid, piece)
    (0..2).each{|column| victory(piece) if (0..2).map{|row| grid[row][column]}.uniq == [piece]}
  end

  def check_leading_diagonal(grid, piece)
    victory(piece) if (0..2).map{|x| grid[x][x]}.uniq == [piece]
  end

  def check_non_leading_diagonal(grid, piece)
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