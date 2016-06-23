require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require './lib/blog.rb'
require './lib/post.rb'
blog = Blog.new()
blog.add_post Post.new("Post 1", "11/12/1980", "Hi", "love", "Jake")
blog.add_post Post.new("Post 2", "11/12/1981", "Bye", "love", "Jake")
blog.add_post Post.new("Post 3", "11/12/1982", "Oh my", "love", "Jake")
blog.add_post Post.new("Post 4", "11/12/1983", "Oh my", "love", "Jake")
blog.add_post Post.new("Post 5", "11/12/1990", "Hi", "love", "Jake")

get '/' do
  @blog = blog
  erb :blog
end

get '/post/:post_number' do
  index = params[:post_number].to_i
  @post = blog.post_container[index]
  erb :post
end

post '/create_post/' do
  content = params[:content]
  title = params[:title]
  date = params[:date]
  author = params[:author]
  category = params[:category]
  post = Post.new(title,date,content,author,category)
  blog.add_post(post)
  redirect to('/')
end
