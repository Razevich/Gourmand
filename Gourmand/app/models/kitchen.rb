class Kitchen < ActiveRecord::Base
  has_many :users_kitchens
  has_many :users, through: :users_kitchens
  has_many :shopping_lists
  has_many :cook_books
  belongs_to :creator, class_name: "User"
  after_save :add_shopping_list

  def add_shopping_list
    self.shopping_lists.create(kitchen_id: self.id)
  end
end
