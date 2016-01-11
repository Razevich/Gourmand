class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text     :username
      t.text     :email
      t.text     :password_digest
      # t.text     :token
      #I am trying to do something here
      t.timestamps null: false
    end
  end
end
