require 'tdd_practice.rb'
require 'rspec'

describe "#my_uniq" do
  it "returns uniq array" do
    expect(my_uniq([1,2,1,3,3])).to eq([1,2,3])
  end
end

describe "Array" do
  describe "#two_sum" do
    it "return indices of elements that sum to 0 " do
      expect([-1, 0, 2, -2, 1].two_sum).to eq ([[0, 4], [2, 3]])
    end
  end
end

describe "#my_transpose" do
  it "return transposed array " do
    expect(my_transpose([
    [0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq ([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

  describe "#stock_picker" do
    it "returns the most profitable pair of days to buy and sell stock" do
      expect(stock_picker([1, 5, 4, 3, 1])).to eq([0, 1])
    end
  end

  describe "Towerofhanoi" do
    subject(:towerofhanoi) {Towerofhanoi.new}

    describe "#initialize" do
        it "creates the initial towers" do
          expect(towerofhanoi.towers).to eq ([[3, 2, 1], [], []])
        end
    end

    describe "#move" do
      it "moves the last disc from one tower to another" do
        expect(towerofhanoi.towers).to eq([[3, 2], [1], []])
        towerofhanoi.move(0, 1)
      end
    end

    describe "#won?" do
      before(:each) {towerofhanoi.towers = [[], [3, 2, 1], []]}
      it "checks if all the discs are in the final tower" do
        expect(towerofhanoi.won?).to be true
      end
    end
  end
