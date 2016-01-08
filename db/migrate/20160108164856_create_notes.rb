class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer  :recipe_id
      t.integer  :user_id
      t.integer  :step_id
      t.text     :body

      t.timestamps null: false
    end
  end
end
