class AddIndexToRecipe < ActiveRecord::Migration
  def change
    add_index :recipe, :name
  end
end
