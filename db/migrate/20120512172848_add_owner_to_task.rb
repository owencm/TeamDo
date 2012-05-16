class AddOwnerToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :owner, :integer
  end
end
