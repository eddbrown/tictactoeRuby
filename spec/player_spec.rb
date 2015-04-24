require 'player'

describe Player do

  let(:player){ Player.new }
  let(:board){ double :board, :place => true }
  let(:game){ double :game, :turn_count => 1 }
  let(:game_o){ double :game, :turn_count => 2, :update_turn => nil }
  let(:game_x){ double :game, :turn_count => 1, :update_turn => nil }
  let(:checker_yes){ double :checker, :status => :in_play }
  let(:checker_no){ double :checker, :status => :x_victory }

  it 'should be able to tell the board where to place a piece' do
    player.piece = :x
    expect(board).to receive(:place).with(:x, 0, 0)
    expect(game).to receive(:update_turn)
    player.place_piece(checker_yes, game, board, 0, 0)
  end 

  it 'should alternately place an x or an o depending on the turn count' do
    player.place_piece(checker_yes, game_o, board, 0, 0)
    expect(player.piece).to eq(:o)
    player.place_piece(checker_yes, game_x, board, 0, 0)
    expect(player.piece).to eq(:x)
  end

  it 'should not add another piece if the game is over' do
    expect(board).not_to receive(:place)
    player.place_piece(checker_no, game, board, 0, 0)
  end
    
end