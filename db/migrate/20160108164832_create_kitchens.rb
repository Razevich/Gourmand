class CreateKitchens < ActiveRecord::Migration
  def change
    create_table :kitchens do |t|
      t.text     :name
      t.integer  :creator_id

      t.timestamps null: false
    end
  end
end
