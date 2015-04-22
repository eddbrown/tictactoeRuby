class Game

  attr_reader :turn_count
  attr_reader :turn

  def initialize
    @turn_count = 1
    @turn = :player_1
  end

  def update_turn
    raise 'board is full' if @turn_count == 9
    @turn_count += 1
    self.turn_toggle
  end

  def turn_toggle
    @turn == :player_2 ? @turn = :player_1 : @turn = :player_2
  end

end