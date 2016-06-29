require './server'
require 'rspec'
require 'rack/test'

describe 'ServerService' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /' do

  end

  describe 'GET /home' do

  end
end
