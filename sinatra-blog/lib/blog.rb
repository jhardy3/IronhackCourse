
class Blog
  attr_reader :post_container
  def initialize(post_container = [])
    @post_container = post_container
  end

  def add_post(post)
    @post_container.push(post)
    @post_container = @post_container.sort do |first_post, second_post|
       second_post.total_date <=> first_post.total_date
    end
  end
end
