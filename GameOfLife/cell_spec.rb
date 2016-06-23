require 'rspec'
require './cell'

describe Cell do

  let(:board) {Board.new(10).create_board}
  describe '#regenerate' do
    it "regenerates a live cell from a live cell if it has 2 neighbours" do
      board["2,4".to_sym] = Cell.new(1, [0,0,0,0,0,0,1,1], [2,4])
      expect(board["2,4".to_sym].regenerate).to eq(1)
    end
  end

  describe '#regenerate' do
    it "regenerates a dead cell from a dead cell if it has 0 neighbours" do
      board["2,4".to_sym] = Cell.new(0, [0,0,0,0,0,0,0,0], [2,4])
      expect(board["2,4".to_sym].regenerate).to eq(0)
    end
  end

  # write more tests to cover all cases

end
