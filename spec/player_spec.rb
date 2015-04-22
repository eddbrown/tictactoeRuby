require 'player'

describe Player do

  let(:player){ Player.new }
  let(:board){ double :board }

  it 'should be not be either player 1 or 2 when created' do
    expect(player.form).to eq(:not_chosen)
  end

  it 'should be able to choose player 1' do
    player.choose(:player_1)
    expect(player.form).to eq(:player_1)
  end

  it 'should only be able to choose p1 or p2' do
    expect{ player.choose(:not_valid_form) }.to raise_error 'invalid choice'
  end

  it 'should be able to reset' do
    player.choose(:player_1)
    player.reset
    expect(player.form).to eq(:not_chosen)
    expect(player.piece).to eq(:not_chosen)
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
    player.choose(:player_1)
    expect(board).to receive(:place).with(player.piece, 0, 0)
    player.place_piece(board, 0, 0)
  end
      
end