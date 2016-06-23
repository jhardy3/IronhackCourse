class Post

  attr_reader :title, :text, :is_sponsored, :date, :category, :author

  def initialize(title, date, text, category, author)
    @title = title
    @date = date
    @text = text
    @category = category
    @author = author
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
