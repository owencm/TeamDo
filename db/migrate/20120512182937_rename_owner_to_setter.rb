class RenameOwnerToSetter < ActiveRecord::Migration
  def up
    rename_column :tasks, :owner, :setter
  end

  def down
    rename_column :tasks, :setter, :owner
  end
end
