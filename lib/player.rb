class Player

  attr_accessor :form
  attr_accessor :piece

  def initialize
    @form = :not_chosen
    @piece = :not_chosen
  end

  def choose player
    @form = player
    player == :player_1 ? @piece = :x : @piece = :o
  end

  def place_piece game, board, row, column
    game.update_turn if board.place(@piece, row, column)
  end


end