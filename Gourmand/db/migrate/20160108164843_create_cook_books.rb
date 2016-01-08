class CreateCookBooks < ActiveRecord::Migration
  def change
    create_table :cook_books do |t|
      t.integer  :kitchen_id
      t.text     :name

      t.timestamps null: false
    end
  end
end
