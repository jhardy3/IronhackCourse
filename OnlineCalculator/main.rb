require 'sinatra'
require 'sinatra/reloader'
require "artii"
require "./calculator"

get '/add' do
  @num = IO.read("save.txt")
  erb :add
end

post '/calculate' do
  num1 = params[:first_num].to_i
  num2 = params[:second_num].to_i
  operation = params[:operation]
  calculator = Calculator.new
  @last_num = calculator.calculate_num(num1, num2, operation)
  "#{calculator.calculate(num1, num2, operation)}"
  erb :save
end

get '/save/:number' do
  num = params[:number]
  IO.write("save.txt", num)
  "SAVED YOUR NUMBER!!!!!!!"
  redirect to("/add")
end
