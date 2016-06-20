require "rspec"
require "./Task"
require "date"
describe 'Task' do
  let(:task_man) { Task.new("Default Task")}


  describe '#complete?' do
    it "returns the status of task completion" do
      result = task_man.complete?
      expect(result).to eq(false)
    end

  end

  describe '#complete!' do
    it "it changes to the status of a tasks completion var to true" do
      new_task = Task.new("Test Task")
      new_task.complete!
      result = new_task.complete?
      expect(result).to eq(true)
    end

  end

  describe '#incomplete!' do
    it "it changes to the status of a tasks completion var to false" do
      new_task = Task.new("Test Task")
      new_task.incomplete!
      result = new_task.complete?
      expect(result).to eq(false)
    end

  end

  describe '#update_content!' do
    it 'it changes the content of the task' do
      new_task = Task.new("False Content")
      new_task.update_content!("True Content")
      result = new_task.content
      expect(result).to eq("True Content")
    end

    it 'it changes the update at var' do
      new_task = Task.new("False Content")
      new_task.update_content!("True Content")
      result = new_task.updated_at
      expect(result.hour).to eq(DateTime.now.hour)
    end
  end

end
describe 'TodoList' do
  let(:list) { TodoList.new("Jake") }


  describe '#add_task' do
    it "adds a task to the list" do
      task = Task.new("Test Task")
      list.add_task(task)
      list_count = list.tasks.length
      expect(list_count).to eq(1)
    end

  end

  describe '#delete_task' do
      it "deletes a task given a task ID" do
      task = Task.new("Task One")
      task2 = Task.new("Task Two")

      list.add_task(task)
      list.add_task(task2)

      list.delete_task(8)

      valid_task = list.tasks[0]
      expect(valid_task.id).to eq(7)
    end

    it "deletes a task given a task ID" do
    task = Task.new("Task One")
    task2 = Task.new("Task Two")

    list.add_task(task)
    list.add_task(task2)

    list.delete_task(10)

    expect(list.tasks.length).to eq(1)
  end

  end
  describe '#find_task' do
    it "finds a task given an Id" do
      task = Task.new("Task One")
      task2 = Task.new("Task Two")
      list.add_task(task)
      list.add_task(task2)
      result = list.find_task(11)
      expect(result.id).to eq(11)
    end

    it "doesnt find a task and returns nil" do
      task = Task.new("Task One")
      task2 = Task.new("Task Two")
      list.add_task(task)
      list.add_task(task2)
      result = list.find_task(11)
      expect(result).to eq(nil)
    end
  end

  describe '#sort_by_date' do
    it "sorts the tasks by date created" do
      task = Task.new("Task One")
      task2 = Task.new("Task Two")
      list.add_task(task2)
      list.add_task(task)
      result = list.sort_by_date
      expect(result).to eq([task, task2])
    end
  end

  describe '#load_tasks' do
    it 'loads the tasks' do
      task = Task. new ( "Walk the dog" )
      task2 = Task. new ( "Buy the milk" )
      task3 = Task. new ( "Make my todo list into a web app" )
      list.add_task(task)
      list.add_task(task2)
      list.add_task(task3)
      list.save
      list.load_tasks
      expect(list.tasks.map { |e| e.id }).to eq([task.id, task2.id, task3.id])
    end
  end

end
