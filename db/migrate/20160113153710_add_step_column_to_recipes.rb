class AddStepColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :step, :text
  end
end