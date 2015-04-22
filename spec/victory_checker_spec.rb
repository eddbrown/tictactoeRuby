require 'victory_checker'
require 'victory_checker_spec_helper'

describe Victory_checker do 

  let(:grid) {Array.new(3) {Array.new(3)}}
  let(:checker) {Victory_checker.new}

  context 'recognises victory' do

    it 'recognises horizontal victory' do
      grid[1][0] = :x
      grid[1][1] = :x
      grid[1][2] = :x
      checker.check(grid)
      expect(checker.status).to eq(:x_victory)
    end

    it 'recognises vertical victory' do
      grid[0][1] = :o
      grid[1][1] = :o
      grid[2][1] = :o
      checker.check(grid)
      expect(checker.status).to eq(:o_victory)
    end

    it 'recognises leading diagonal victory' do
      grid[0][0] = :o
      grid[1][1] = :o
      grid[2][2] = :o
      checker.check(grid)
      expect(checker.status).to eq(:o_victory)
    end

    it 'recognises anti diagonal victory' do
      grid[0][2] = :x
      grid[1][1] = :x
      grid[2][0] = :x
      checker.check(grid)
      expect(checker.status).to eq(:x_victory)
    end

  end

  context 'recognises when there is not a winner' do
    it 'recognises a draw' do
      fill_in_draw
      checker.check(grid)
      expect(checker.status).to eq(:draw)
    end

    it 'recognises when the game is still in play' do
      grid[0][2] = :x
      grid[1][1] = :o
      checker.check(grid)
      expect(checker.status).to eq(:in_play)
    end
  end
end











