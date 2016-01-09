class User < ActiveRecord::Base
  has_many :recipes
  has_many :notes
  has_many :users_kitchens
  has_many :kitchens, through: :users_kitchens

  has_secure_password
end
