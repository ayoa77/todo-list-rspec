require "rspec"

require_relative "list"
require_relative "task"

describe List do

  let(:task) {Task.new("run with dog")}
  let(:title) {"Animal stuff"}
  let(:tasks) {[task, Task.new("Clean elephant poo"), Task.new("Give rabbit to Mei"), Task.new("Clean giraffe poo"), Task.new("Clean koala poo")]}
  let(:list) {List.new(title, tasks)}

describe "#initialize" do
  it "should contain one title and an array of tasks" do
    expect(List.new("Animals", [123,"abc"])).to be_a_kind_of(List)
  end
  it "requires atleast one argument" do
    expect{List.new}.to raise_error(ArgumentError)
  end
end
describe "#title" do
  it "should return the correct title for the list" do
    expect(list.title).to eq title
  end
end
describe "#tasks" do
  it "should return the correct array of tasks for the list" do
    expect(list.tasks).to eq tasks
  end
end

describe "#add_task" do
  it "requires one argument" do
  expect{list.add_task}.to raise_error(ArgumentError)
end
  it "will add a task to the tasks array" do
  expect{list.add_task(task)}.to change{list.tasks.count}.by(+1)
end
end

describe "#complete_task" do
  it "check if tasks[index] is valid(not nil)" do
  expect(list.tasks[0]).to eq(task)
end
  it "returns false if the index is nil" do
    expect(list.complete_task(999999)).to be(false)
  end
  it "returns true if the task in the array is completed" do
      expect(list.complete_task(0)).to be(true)
    end
  end
describe "#delete_task" do
  it "check if tasks[index] is deleted?" do
  expect{list.delete_task(0)}.to change{list.tasks.count}.by(-1)
  end
end
  describe "#completed_tasks" do
        it "show list of completed tasks from task array" do
            list.tasks[0].complete!
            list.tasks[1].complete!
            expect(list.completed_tasks).to eq([list.tasks[0],list.tasks[1]])
        end
    end
describe "#incomplete_tasks" do
      it "shows list of incomplete tasks from task_array" do
      list.tasks[0].complete!
      list.tasks[1].complete!
    expect(list.incomplete_tasks).to eq([list.tasks[2], list.tasks[3], list.tasks[4]])
    end
  end
end
