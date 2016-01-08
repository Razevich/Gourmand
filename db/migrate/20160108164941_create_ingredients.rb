class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer  :shopping_list_id
      t.text     :name
      t.integer  :quantity

      t.timestamps null: false
    end
  end
end
