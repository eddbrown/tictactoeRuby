class Victory_checker

  attr_accessor :status

  def initialize
    @status
  end

  def check(grid)
    [:x,:o].each{|piece| check_horizontal(grid, piece)}
    [:x,:o].each{|piece| check_vertical(grid, piece)}
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





  def victory(piece)
    @status = (piece.to_s + '_victory').to_sym
  end


end