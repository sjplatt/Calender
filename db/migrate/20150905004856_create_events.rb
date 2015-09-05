class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :datetime
      t.text :website
      t.text :description
      t.text :hostclass
      t.text :location

      t.timestamps null: false
    end
  end
end
