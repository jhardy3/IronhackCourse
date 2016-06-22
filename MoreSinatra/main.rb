require 'sinatra'
require 'sinatra/reloader'
require 'pry'

enable(:sessions)


get '/?:user?' do
  @username = params[:user]
  if session[:logged_in]
    erb :user
  else
    erb :login
  end
end

post '/check_cred' do
  @username = params[:username]
  @password = params[:password]
  session[:logged_in] = true
  redirect to("/#{@username}")
end

post '/log_out' do
  session[:logged_in] = false
  redirect to('/')
end







VALID_USERS = {
  unai: 1234,
  jonsnow: 4321
}.freeze



get '/login' do

end

post '/login' do
  username = params[:username]
  password = params[:password]

  if LoginService.new(username, password).logIn
    session[:current_user] = {
    :username => username,
    :password => password
  }

    redirect to('/profile')
  else
    redirect to('/login')
end

get '/profile' do
  if LoginService.new(username, password).logIn
    erb :profile
  else
    redirect to('/login')
end
