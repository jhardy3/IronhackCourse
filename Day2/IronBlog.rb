require "colorize"

class Blog

  def initialize(post_container = [])
    @current_page = 1
    @total_pages = 1
    @post_container = post_container
  end

  def turn_page_forward
    if @current_page < @total_pages
      @current_page += 1
      post_max = @current_page * 3 - 1
      post_min = post_max - 2
      posts = []
      @post_container.each_with_index do |post, index|
        if index >= post_min && index <= post_max
          posts.push(post)
        end
      end
      publish_page(posts)
    end
  end

  def turn_page_backward
    if @current_page > 1
      @current_page -= 1
      post_max = @current_page * 3 - 1
      post_min = post_max - 2
      posts = []
      @post_container.each_with_index do |post, index|
        if index >= post_min && index <= post_max
          posts.push(post)
        end
      end
      publish_page(posts)
    end
  end

  def publish_page(posts)
    #order by date here
    #Date Format MM/DD/YYYY
    posts.each do |post|
      post.post_formatter
    end
    (@total_pages + 1).times do |num|
      if num == @current_page
        print("[#{num}] ".colorize(:blue))
      elsif num != 0
      print("[#{num}] ")
      end
    end
    puts ""
    puts ""
    puts ""
  end

  def publish_front_page
    @post_container.take(3).each do |post|
      post.post_formatter
    end
    (@total_pages + 1).times do |num|
      if num == @current_page
        print("[#{num}] ".colorize(:blue))
      elsif num != 0
      print("[#{num}] ")
      end
    end
    puts ""
    puts ""
    puts ""
  end

  def add_post(post)
    @post_container.push(post)
    if @post_container.length % 3 == 0
      @total_pages = @post_container.length / 3
    else
      @total_pages = (@post_container.length / 3) + 1
    end
    @post_container = @post_container.sort do |first_post, second_post|
      first_post.total_date <=> second_post.total_date
    end
  end

end

class Post

  attr_reader :title, :text, :is_sponsored

  def initialize(title, date, text, is_sponsored = false)
    @is_sponsored = is_sponsored
    @title = title
    @date = date
    @text = text
  end

  def post_formatter
    puts "#{@title}"
    puts "**************"
    puts @text
    puts "________________"
  end

  def total_date
    date_component = @date.split"/"
    date_numbers = date_component.map { |num| num.to_i }
    if date_numbers[0] == 1 || date_numbers[0] == 3 || date_numbers[0] == 5 || date_numbers[0] == 7 || date_numbers[0] == 8 || date_numbers[0] == 10 || date_numbers[0] == 12
      month_days = date_numbers[0] * 31
    elsif date_numbers[0] == 4 || date_numbers[0] == 6 || date_numbers[0] = 9 || date_numbers[0] == 11
      month_days = date_numbers[0] * 30
    else
      month_days = date_numbers[0] * 28
    end
    year_days = date_numbers[2] * 365
    days = date_numbers[1] + month_days + year_days
  end
end

class SponsoredPost < Post
  def post_formatter(post)
    puts "******#{@title}******"
    puts "**************"
    puts @text
    puts "________________"
  end

end

blog = Blog.new
blog.add_post Post.new("Post 1", "11/12/1980", "Hi", true)
blog.add_post Post.new("Post 2", "11/12/1981", "Bye")
blog.add_post Post.new("Post 3", "11/12/1982", "Oh my")
blog.add_post Post.new("Post 4", "11/12/1983", "Oh my")
blog.add_post Post.new("Post 5", "11/12/1990", "Hi", true)
blog.add_post Post.new("Post 6", "11/12/1991", "Bye")
blog.add_post Post.new("Post 7", "11/12/1992", "Oh my")
blog.add_post Post.new("Post 8", "11/12/1993", "Oh my")
blog.add_post Post.new("Post 9", "11/12/1994", "Oh my")

blog.publish_front_page

def use_blog(blog)
puts"Use < to go back and > to go forward. type 'esc' to exit"
input = gets.chomp

if input == "<"
  blog.turn_page_backward
  use_blog(blog)
elsif input == ">"
  blog.turn_page_forward
  use_blog(blog)
elsif input == "esc"

end

end

use_blog(blog)
