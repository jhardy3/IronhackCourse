
require './lib/blog'
require 'rspec'
require 'rack/test'

describe 'Blog' do
  include Rack::Test::Methods
  let(:blog) { Blog.new }

  describe 'add_post' do
    it 'adds a post' do
      post = Post.new("New","11/2/1994","Sick", "love", "Jake")
      blog.add_post(post)
      expect(blog.post_container.length).to eq(1)
    end
  end
end
