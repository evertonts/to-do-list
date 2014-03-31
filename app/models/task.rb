class Task < ActiveRecord::Base
  validates_length_of :description, :minimum => 2, :allow_blank => false
  validate :validate_max_number_of_tasks
  
  def validate_max_number_of_tasks
    if Task.all.size >= 5 
      errors.add('', "can not add more then 5 tasks")
    end
  end
  
end
