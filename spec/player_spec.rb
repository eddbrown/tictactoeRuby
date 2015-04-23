require 'player'

describe Player do

  let(:player){ Player.new }
  let(:player2){ Player.new }
  let(:board){ double :board }
  let(:game){ double :game }

  it 'should be not be either player 1 or 2 when created' do
    expect(player.form).to eq(:not_chosen)
  end

  it 'should be able to choose player 1' do
    player.choose(:player_1)
    expect(player.form).to eq(:player_1)
  end

  it 'player 1 should have an x as their piece' do
    player.choose(:player_1)
    expect(player.piece).to eq(:x)
  end

  it 'player 2 should have an o as their piece' do
    player.choose(:player_2)
    expect(player.piece).to eq(:o)
  end

  it 'should be able to tell the board where to place a piece' do
    allow(board).to receive(:place).and_return(true)
    expect(board).to receive(:place).with(:x, 0, 0)
    expect(game).to receive(:update_turn)
    player.choose(:player_1)
    player.place_piece(game, board, 0, 0)
  end 
    
end