class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(3) {Array.new(3)}
    @valid_pieces = [:x, :o, nil]
  end

  def place(piece, row, column)
    raise ('board is full') if self.full?
    raise('invalid piece') if !@valid_pieces.include? piece
    @grid[row][column] = piece 
  end

  def full?
    !@grid.flatten.include? nil
  end

end