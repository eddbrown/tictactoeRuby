class Player

  attr_accessor :form
  attr_accessor :piece

  def initialize
    @form = :not_chosen
    @valid_choices = [:player_1, :player_2]
    @piece = :not_chosen
  end

  def choose player
    @form = player
    player == :player_1 ? @piece = :x : @piece = :o
  end

  def place_piece board, row, column
    board.place(@piece, row, column)
  end


end