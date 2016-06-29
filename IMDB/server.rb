require 'sinatra'
require 'sinatra/reloader'
require './lib/movie'

get '/' do
  erb :home_page
end


post '/search' do
  search_term = params[:movie_title]
  @movies = MovieController.new.search_movies(search_term)
  @question = QuestionController.new(@movies).generate_question
  @answer = @movies[0].id
  erb :search
end

post '/answer/:id_one/:id_two' do
  id_one = params[:id_one]
  id_two = params[:id_two]
  if QuestionController.check_question(id_one, id_two)
    erb :win
  else
    erb :lose
  end
end
