class StringCalculator

  def initialize()
  end

  def add(numbers)
    number_array = numbers.split(",")
    sum = 0
    number_array.each do |num|
      sum += num.to_i
    end

    sum
  end
end


class FizzBuzzer
  def initalize()
  end

  def is_fizz(number)
    if number % 3 == 0
      true
    else
      false
    end
  end

  def is_buzz(number)
    if number % 5 == 0
      true
    else
      false
    end
  end

  def fizz_buzzin(number)
    if is_fizz(number) && is_buzz(number)
      "FizzBuzz"
    elsif is_fizz(number)
      "Fizz"
    elsif is_buzz(number)
      "Buzz"
    else
      "#{number}"
    end
  end

end
