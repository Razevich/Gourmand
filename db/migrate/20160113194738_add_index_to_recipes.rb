class AddIndexToRecipes < ActiveRecord::Migration
  def change
    add_index :recipes, :name
  end
end
