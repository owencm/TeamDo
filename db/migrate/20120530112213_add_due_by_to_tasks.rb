class AddDueByToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :due_by, :datetime
  end
end
