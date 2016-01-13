class AddStepColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :step, :text
  end
end


add_index :cook_books, :name