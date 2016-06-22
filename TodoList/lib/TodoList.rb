require 'date'
require 'yaml/store'

class TodoList
  attr_reader :tasks

  def initialize(user, tasks = [])
    @count = 0
    @todo_store = YAML::Store.new("./Public/tasks.yml")
    @user = user
    @tasks = tasks
  end

  def add_task(task)
    @count += 1
    task.id = @count
    tasks.push(task)
    save
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
      @todo_store[:count] = @count
    end
  end

  def load_tasks
    tasks = YAML::load(File.open("./Public/tasks.yml"))
    if tasks[@user] == nil
      @tasks = []
    else
      @tasks = tasks[@user]
    end
    @count = tasks[:count].to_i
  end

  def incomplete_tasks
    incomplete_tasks = []
    if @tasks != nil
      @tasks.each do |task|
        if !task.complete?
          incomplete_tasks.push(task)
        end
      end
    end
    incomplete_tasks
    # incomplete_tasks.delete_if { |task| task.complete? }
  end

  def complete_tasks
    complete_tasks = []
    if @tasks != nil
      @tasks.each do |task|
        if task.complete?
          complete_tasks.push(task)
        end
      end
    end
    complete_tasks
  end
end
