class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :username
      t.string :password
      t.integer :user_id
     
      t.timestamps
    end
  end
end
