class AddIndexToKitchen < ActiveRecord::Migration
  def change
    add_index :kitchen, :name
  end
end
