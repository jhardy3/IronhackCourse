require "rspec"
require "./Calculator"

describe 'StringCalculator' do
  describe '#add' do

    it 'returns 0 for no numbers' do
      result = StringCalculator.new.add("")
      expect(result).to eq(0)
    end

    it 'returns 6 for 1,2,3' do
      result = StringCalculator.new.add("1,2,3")
      expect(result).to eq(6)
    end
  end

  describe '#is_fizz' do

    it 'returns true for 3' do
      result = FizzBuzzer.new.is_fizz(3)
      expect(result).to eq(true)
    end

    it 'returns true for 6' do
      result = FizzBuzzer.new.is_fizz(6)
      expect(result).to eq(true)
    end

    it 'returns false for 5' do
      result = FizzBuzzer.new.is_fizz(5)
      expect(result).to eq(false)
    end

  end

  describe '#is_buzz' do

    it 'returns true for 5' do
      result = FizzBuzzer.new.is_buzz(5)
      expect(result).to eq(true)
    end

    it 'returns true for 10' do
      result = FizzBuzzer.new.is_buzz(10)
      expect(result).to eq(true)
    end

    it 'returns false for 54' do
      result = FizzBuzzer.new.is_buzz(54)
      expect(result).to eq(false)
    end

  end

  describe '#fizz_buzzin' do

    it 'returns "FizzBuzz" for 15' do
      result = FizzBuzzer.new.fizz_buzzin(15)
      expect(result).to eq("FizzBuzz")
    end

    it 'returns "Fizz" for 33' do
      result = FizzBuzzer.new.fizz_buzzin(3)
      expect(result).to eq("Fizz")
    end

    it 'returns "Buzz" for 20' do
      result = FizzBuzzer.new.fizz_buzzin(20)
      expect(result).to eq("Buzz")
    end

    it 'returns "7" for 7' do
      result = FizzBuzzer.new.fizz_buzzin(7)
      expect(result).to eq("7")
    end


  end

end
