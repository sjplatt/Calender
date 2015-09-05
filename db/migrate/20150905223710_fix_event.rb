class FixEvent < ActiveRecord::Migration
  def change
    rename_column :events, :datetime, :starttime
    add_column :events, :endtime, :datetime
  end
end
