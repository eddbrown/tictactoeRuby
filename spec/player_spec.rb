require 'player'

describe Player do

  let(:player){ Player.new }
  let(:board){ double :board, :place => true }
  let(:game){ double :game, :turn_count => 1 }
  let(:game1){ double :game, :turn_count => 2, :update_turn => nil }
  let(:game2){ double :game, :turn_count => 1, :update_turn => nil }

  it 'should be able to tell the board where to place a piece' do
    player.piece = :x
    expect(board).to receive(:place).with(:x, 0, 0)
    expect(game).to receive(:update_turn)
    player.place_piece(game, board, 0, 0)
  end 

  it 'should alternately place an x or an o depending on the turn count' do
    player.place_piece(game1, board, 0, 0)
    expect(player.piece).to eq(:o)
    player.place_piece(game2, board, 0, 0)
    expect(player.piece).to eq(:x)
  end
    
end