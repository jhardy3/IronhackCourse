require 'sinatra'
require 'sinatra/reloader'
require 'artii'

get '/ascii/:word/?:font?' do
  if params[:font] == nil
    font = 'doh'
  else
    font = params[:font]
  end

  @arti = Artii::Base.new :font => font
  @word = @arti.asciify(params[:word])

  erb :ascii
end

get '/ascii/wolf/special/secret' do
  erb :wolf
end
