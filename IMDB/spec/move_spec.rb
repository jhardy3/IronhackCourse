require 'rspec'
require './lib/movie.rb'
require 'rack/test'

describe 'MovieController' do
  include Rack::Test::Methods

  let(:movie_controller) { MovieController.new }
  let(:search_term) {"Forrest Gump"}

  describe 'search_movies' do
    it 'searches movies and returns a movie array' do
      movies = movie_controller.search_movies(search_term)
      expect(movies[0].title).to eq("Forrest Gump (1994)")
    end
  end
end

describe 'QuestionController' do
  include Rack::Test::Methods
  let(:movie_controller) { MovieController.new }
  let(:search_term) {"Forrest Gump"}
  let(:question_controller) { QuestionController.new(movie_controller.search_movies(search_term))}

  describe 'generate_question' do
    it 'generates a question' do
      question = question_controller.generate_question
      expect(question).to eq("Which movie was produced in 6 July 1994 (USA)?")
    end
  end

  describe 'check_question' do
    it 'checks the answer of a question' do
      question_checked = QuestionController.check_question("0109830","0109830")
      expect(question_checked).to eq(true)
    end
  end

end
