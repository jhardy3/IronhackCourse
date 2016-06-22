require 'sinatra'
require 'sinatra/reloader'
require 'date'

get '/' do
  "Hello World!"
end

get '/about' do
  erb :about
end

get '/hi' do
  @name = "Jake"
  erb :hi
end

get '/time' do
  @time ="#{DateTime.now.hour}:#{DateTime.now.minute} "
  erb :time
end

get '/fruits' do
  @fruits = %w(oranges lemons apples)
  erb :fruits
end

get '/users/:username' do
  @username = params[:username]
  erb :user
end

get '/hours/ago/:number' do
  @difference = params[:number].to_i
  @current_hour = DateTime.now.hour.to_i
  erb :hours_ago
end
