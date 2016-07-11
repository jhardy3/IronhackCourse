class TextInspectionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    @text = params[:text_inspection][:user_text]
    @word_count = @text.split(" ").length
    @minutes = @word_count / 275.0

    @hashed = {}
    @text.split(" ").each do |word|
      if @hashed[word] != nil
        @hashed[word] = @hashed[word] + 1
      else
        @hashed[word] = 1
      end
    end
    
    @hashed = @hashed.sort_by(&:last).reverse
    @new_array = @hashed.values_at(0..9).map { |e| e[0]  }

    render 'results'
  end
end
