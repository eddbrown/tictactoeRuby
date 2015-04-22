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

  it 'should not be able to go past nine turns' do
    8.times {game.update_turn}
    expect{game.update_turn}.to raise_error 'board is full'
  end

  it 'should say who\'s go it is' do
    expect(game.turn).to eq(:player_1)
    game.update_turn
    expect(game.turn).to eq(:player_2)
  end


end