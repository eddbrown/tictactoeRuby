require 'board'

describe Board do

  let (:board){Board.new}

  it 'has somewhere to store pieces' do
    expect(board.grid[0][0]).to eq(nil)
  end

  it 'can store an object' do
    board.place(:x, 0, 0)
    expect(board.grid[0][0]).to eq(:x)
  end

  it 'can reset' do
    board.place(:x, 0, 0)
    board.reset!
    expect(board).to be_empty
  end

  it 'should not be able to place where there are already pieces' do
    board.place(:x, 0, 0)
    board.place(:o, 0, 0)
    expect(board.grid[0][0]).to eq(:x)
  end
end

