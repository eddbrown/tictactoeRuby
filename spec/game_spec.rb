require 'game'

describe Game do 

  let(:game) {Game.new}

  it 'should have a turn' do
    expect(game.turn_count).to eq(1)
  end

  it 'the turn should be able to update' do
    game.update_turn
    expect(game.turn_count).to eq(2)
  end
  
  it 'should say who\'s go it is' do
    expect(game.turn).to eq(:player_1)
    game.update_turn
    expect(game.turn).to eq(:player_2)
  end

  it 'should reset' do
    game.update_turn
    game.reset!
    expect(game.turn_count).to eq(1)
  end


end