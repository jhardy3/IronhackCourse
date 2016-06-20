require "rspec"
require "./Lexiconomitron"

describe "Lexiconomitron" do

  let(:lexi) { Lexiconomitron.new }

  describe '#eat_t' do
    let(:input) {"great scott!"}
    let(:output) {"grea sco!"}

    it "removes every letter t from the input" do

      lexi = Lexiconomitron.new
      expect(lexi.eat_t(input)).to eq(output)
    end
  end

  describe '#shazam' do
    let(:input) {["This", "is", "a", "boring", "test"]}
    let(:output) {["sih", "se"]}

    it "reverses every string in array" do
      lexi = Lexiconomitron.new
      expect(lexi.shazam(input)).to eq(output)
    end
  end

  describe '#oompa_loompa' do
    let(:input) {["if", "you", "wanna", "be", "my", "lover"]}
    let(:output) {["if", "you", "be", "my"]}

    it "only prints words < 3" do
      lexi = Lexiconomitron.new
      expect(lexi.oompa_loompa(input)).to eq(output)
    end
  end
end
