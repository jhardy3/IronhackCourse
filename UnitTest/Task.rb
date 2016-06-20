require 'date'
require 'yaml/store'

class TodoList
  attr_reader :tasks

  def initialize(user)
    @todo_store = YAML::Store.new("./Public/tasks.yml")
    @user = user
    @tasks = []
  end

  def add_task(task)
    tasks.push(task)
  end

  def delete_task(task_id)
    @tasks.delete_if { |e| e.id == task_id }
  end

  def find_task(task_id)
    @tasks.find { |e| e.id == task_id  }
  end

  def sort_by_date
    @tasks.sort! { |a, b| a.created_at <=> b.created_at }
  end

  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end

  def load_tasks
    tasks = YAML::load(File.open("./Public/tasks.yml"))
    @tasks = tasks[@user]
  end
end

class Task
  attr_reader :content, :id, :updated_at, :created_at
  @@id_count = 1
  def initialize(content)
    @created_at = DateTime.now
    @updated_at
    @complete = false
    @content = content
    @id = @@id_count
    @@id_count = @@id_count + 1
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
