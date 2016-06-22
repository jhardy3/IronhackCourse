# if __FILE__ == $PROGRAM_NAME
#
# end
require 'date'
require 'yaml/store'

class Task
  attr_accessor :content, :id, :updated_at, :created_at
  def initialize(content)
    @created_at = DateTime.now
    @updated_at
    @complete = false
    @content = content
    @id = 0
  end

  def complete?
    @complete
  end

  def complete!
    @complete = true
  end

  def incomplete!
    @complete = false
  end

  def update_content!(content)
    @updated_at = DateTime.now
    @content = content
  end

end
