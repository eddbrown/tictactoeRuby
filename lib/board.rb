class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(3) {Array.new(3)}
    @status = :in_play
  end

  def place(piece, row, column)
    if @grid[row][column] == nil
      @grid[row][column] = piece
      true
    else 
      false
    end
  end

  def reset!
    @grid = Array.new(3) {Array.new(3)}
  end

  def empty?
    @grid.flatten.uniq == [nil]
  end

end