class Eventuser < ActiveRecord::Migration
  def change
    add_reference :events, :users, index:true
  end
end
