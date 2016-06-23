require './server'
require 'rspec'
require 'rack/test'

describe 'ServerService' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /' do
    it 'returns 200 OK' do
      get '/'
      expect(last_response.status).to eq(200)
    end

    it 'includes Im home do' do
      get '/'
      expect(last_response.body).to include("I'm home")
    end
  end

  describe 'GET /home' do
    it 'returns true / from redirect' do
      get '/home'
      expect(last_response.redirect?).to eq(true)
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end
end
