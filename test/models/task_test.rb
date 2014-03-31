require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "New tasks shold not be already done" do
    task = Task.new
    assert !task.done?
  end
  
  test "Should not save a task with a description shorter than 2 characters" do
    task = Task.new
    assert !task.save
    task.description = "a"
    assert !task.save
  end
end
