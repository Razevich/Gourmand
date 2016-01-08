class Kitchen < ActiveRecord::Base
  has_many :users_kitchens
  has_many :users, through: :users_kitchens
  belongs_to :creator, class_name: "User"
end
