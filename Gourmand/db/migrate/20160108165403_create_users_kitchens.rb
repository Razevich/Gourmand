class CreateUsersKitchens < ActiveRecord::Migration
  def change
    create_table :users_kitchens do |t|
      t.integer  :user_id
      t.integer  :kitchen_id

      t.timestamps null: false
    end
  end
end
