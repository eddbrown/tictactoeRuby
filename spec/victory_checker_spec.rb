require 'victory_checker'

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

  end
end