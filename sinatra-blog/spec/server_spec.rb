require './server'
require 'rspec'
require 'rack/test'

describe 'IronBlog' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /' do
    it 'returns 200 OK' do
      get '/'
      expect(last_response.status).to eq(200)
    end
  end

  describe 'GET /post/:post_number' do
    it 'opens existing post' do
      get '/post/1'
      expect(last_response.status).to eq(200)
    end
  end
end
