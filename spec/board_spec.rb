require 'board'

describe Board do

  let (:board){Board.new}

  it 'has somewhere to store pieces' do
    expect(board.grid[0]).to eq(nil)
  end




end