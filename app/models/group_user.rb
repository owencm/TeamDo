class GroupUser < ActiveRecord::Base
  attr_accessible :group_id, :user_id
  belongs_to :group
  belongs_to :user
  validates_presence_of :group_id, :user_id
end
