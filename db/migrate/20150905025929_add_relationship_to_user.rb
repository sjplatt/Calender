class AddRelationshipToUser < ActiveRecord::Migration
  def change
    add_reference :users, :relationship, index:true 
  end
end
