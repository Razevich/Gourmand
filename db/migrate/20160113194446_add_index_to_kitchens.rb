class AddIndexToKitchens < ActiveRecord::Migration
  def change
    add_index :kitchens, :name
  end
end
