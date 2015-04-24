class Player

  attr_accessor :piece

  def initialize
    @piece
  end

  def place_piece game, board, row, column
    @piece = [:o, :x][game.turn_count % 2]
    game.update_turn if board.place(@piece, row, column)
  end


end