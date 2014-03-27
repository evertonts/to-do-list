require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "New tasks shold not be already done" do
    task = Task.new
    assert !task.done?
  end
  
  test "Should not save a task without a description" do
    task = Task.new
    assert !task.save
  end
end
