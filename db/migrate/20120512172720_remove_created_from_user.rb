class RemoveCreatedFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :created
      end

  def down
    add_column :users, :created, :time
  end
end
