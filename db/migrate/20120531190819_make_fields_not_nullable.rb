class MakeFieldsNotNullable < ActiveRecord::Migration
  def up
    change_column :group_users, :user_id, :integer, :null => false
    change_column :group_users, :group_id, :integer, :null => false
    change_column :groups, :name, :string, :null => false   
    change_column :task_doers, :user_id, :integer, :null => false 
    change_column :task_doers, :task_id, :integer, :null => false
    change_column :tasks, :title, :string, :null => false
    change_column :tasks, :setter_id, :integer, :null => false
    change_column :tasks, :task_id, :integer, :null => false
    change_column :tasks, :due_by, :datetime, :null => false
    change_column :users, :first, :string, :null => false
    change_column :users, :last, :string, :null => false
    change_column :users, :email, :string, :null => false
    change_column :users, :user_id, :integer, :null => false
  end

  def down
    change_column :group_users, :user_id, :integer, :null => true
    change_column :group_users, :group_id, :integer, :null => true
    change_column :groups, :name, :string, :null => true   
    change_column :task_doers, :user_id, :integer, :null => true 
    change_column :task_doers, :task_id, :integer, :null => true
    change_column :tasks, :title, :string, :null => true
    change_column :tasks, :setter_id, :integer, :null => true
    change_column :tasks, :task_id, :integer, :null => true
    change_column :tasks, :due_by, :datetime, :null => true
    change_column :users, :first, :string, :null => true
    change_column :users, :last, :string, :null => true
    change_column :users, :email, :string, :null => true
    change_column :users, :user_id, :integer, :null => true
  end
end
