require 'board'
require 'board_spec_helper'

describe Board do

  let (:board){Board.new}

  it 'has somewhere to store pieces' do
    expect(board.grid[0][0]).to eq(nil)
  end

  it 'can store an object' do
    board.place(:x, 0, 0)
    expect(board.grid[0][0]).to eq(:x)
  end

  it 'can only store an x or an o, else it is nil' do
    expect{board.place(:t, 0, 0)}.to raise_error('invalid piece')
  end

  it 'knows when it is full' do
    fill_board
    expect(board).to be_full
  end

  it 'cannot accept anymore pieces if full' do
    fill_board
    expect{board.place(:x, 0, 0)}.to raise_error('board is full')
  end

  it 'can reset' do
    fill_board
    board.reset!
    expect(board).to be_empty
  end
end

