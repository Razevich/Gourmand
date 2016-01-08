class Kitchen < ActiveRecord::Base
  has_many :users_kitchens
  has_many :users, through: :users_kitchens
  has_many :shopping_lists
  has_many :cook_books
  belongs_to :creator, class_name: "User"
end
