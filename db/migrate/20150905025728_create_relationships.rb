class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.text :type

      t.timestamps null: false
    end

    add_reference :relationships, :user, index: true 
  end
end
