require 'sinatra'
require 'sinatra/reloader'

require './lib/Task.rb'
require './lib/TodoList.rb'

todo_list = TodoList.new("Jake")
todo_list.load_tasks

get "/tasks" do
  @incomplete_tasks = todo_list.incomplete_tasks
  @complete_tasks = todo_list.complete_tasks
  erb :task_index
end

post '/new_task' do
  content = params[:task_content]
  new_task = Task.new(content)
  todo_list.add_task(new_task)
  redirect to('/tasks')
end

post '/complete_task/:id' do
  id = params[:id].to_i
  task = todo_list.find_task(id)
  task.complete!
  todo_list.save
  redirect to('/tasks')
end
