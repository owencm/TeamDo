class User < ActiveRecord::Base

  has_many :from_me_tasks, :foreign_key => "setter_id", :class_name => "Task"
  
  has_many :task_matches, :foreign_key => "user_id", :class_name => "TaskDoer"
  
  has_many :to_me_tasks, :through => :task_matches, :source => "task" #source indicates what to look for in the join table
  
  attr_accessible :email, :first, :last
  
  validates_presence_of :email, :first, :last
  
  has_many :group_users
  
  has_many :groups, :through => :group_users, :source => "group"
  
  def outstanding_tasks 
    self.to_me_tasks.find_all_by_completed_at(nil)
  end
  
  def past_tasks
    self.to_me_tasks.where("completed_at IS NOT NULL")
  end
  
  def has_outstanding_tasks
    outstanding_tasks.count > 0
  end
  
  def has_past_tasks
    past_tasks.count > 0
  end
  
end
