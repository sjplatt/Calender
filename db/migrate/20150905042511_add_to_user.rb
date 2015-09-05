class AddToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :text
    add_column :users, :picture, :text
    add_column :users, :fblink, :text
  end
end
