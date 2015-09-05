class FixRelationships < ActiveRecord::Migration
  def change
    rename_column :relationships, :type, :reltype
  end
end
