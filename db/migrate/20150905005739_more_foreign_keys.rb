class MoreForeignKeys < ActiveRecord::Migration
  def change
    add_reference :events, :comments, index:true
    add_reference :users, :events, index:true
  end
end
