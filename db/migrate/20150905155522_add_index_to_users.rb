class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :facebookid, unique: true, length: 50
  end
end
