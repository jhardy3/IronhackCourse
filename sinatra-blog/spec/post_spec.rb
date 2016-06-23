require 'rspec'

require("./lib/post.rb")

describe "Post" do
  let(:post) {Post.new("title", "11/12/1980", "content", "love", "Jake")}

  describe "total_date" do
    it 'returns the total date' do
      expect(post.total_date).to eq(722982)
    end
  end
end
