class TaskDoer < ActiveRecord::Base

  belongs_to :task
  belongs_to :user

  attr_accessible :task_id, :user_id
end
