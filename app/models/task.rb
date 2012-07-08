class Task < ActiveRecord::Base

  belongs_to :setter, :class_name => "User"
  
  belongs_to :group 
  
  has_many :task_matches, :foreign_key => "task_id", :class_name => "TaskDoer"
  
  has_many :doers, :through => :task_matches, :source => "user"

  attr_accessible :description, :title, :setter_id, :due_by, :completed_at, :group_id, :doers
  
  validates_presence_of :title, :setter_id, :due_by, :group_id
  
end
