require "sinatra/reloader"

class Calculator
  attr_reader :last_num

  def calculate(num1, num2, operation)
    if operation == "ADD"
      @@last_num = num1 + num2
      @total_str = "#{num1} + #{num2} = #{num1 + num2}"
    elsif operation == "SUB"
      @@last_num = num1 - num2
      @total_str = "#{num1} - #{num2} = #{num1 - num2}"
    elsif operation == "MUL"
      @@last_num = num1 * num2
      @total_str = "#{num1} * #{num2} = #{num1 * num2}"
    else operation == "DIV"
      @@last_num = num1 / num2
      @total_str = "#{num1} / #{num2} = #{num1 / num2}"
    end
  @total_str
  end

  def calculate_num(num1, num2, operation)
    if operation == "ADD"
      num1 + num2
    elsif operation == "SUB"
      num1 - num2
    elsif operation == "MUL"
      num1 * num2
    else operation == "DIV"
      num1 / num2
    end
  end
end
