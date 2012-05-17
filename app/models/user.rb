class User < ActiveRecord::Base

  has_many :from_me_tasks, :foreign_key => "setter_id", :class_name => "Task"
  
  has_many :task_matches, :foreign_key => "user_id", :class_name => "TaskDoer"
  
  has_many :to_me_tasks, :through => :task_matches, :source => "task" #source indicates what to look for in the join table
  
  attr_accessible :created, :email, :first, :last, :password, :username
  
end
