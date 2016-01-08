class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer  :user_id
      t.integer  :cook_book_id
      t.text     :name

      t.timestamps null: false
    end
  end
end
