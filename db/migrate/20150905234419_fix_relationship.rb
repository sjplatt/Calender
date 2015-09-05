class FixRelationship < ActiveRecord::Migration
  def change
    add_column :relationships, :otherid, :text
  end
end
