class Player

  attr_accessor :piece

  def initialize
    @piece
  end

  def place_piece checker, game, board, row, column
    @piece = [:o, :x][game.turn_count % 2]
    if checker.status == :in_play
      game.update_turn if board.place(@piece, row, column)
    end
  end


end