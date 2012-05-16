class RenameSetterToSetterId < ActiveRecord::Migration
  def up
    rename_column :tasks, :setter, :setter_id
  end

  def down
    rename_column :tasks, :setter_id, :setter
  end
end
