class Addcommon < ActiveRecord::Migration
  def change
    add_column :events, :attending, :text
  end
end
