class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(3) {Array.new(3)}
    @status = :in_play
  end

  def place(piece, row, column)
    @grid[row][column] = piece 
  end

  def reset!
    @grid = Array.new(3) {Array.new(3)}
  end

  def empty?
    @grid.flatten.uniq == [nil]
  end

end