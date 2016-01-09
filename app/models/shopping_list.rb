class ShoppingList < ActiveRecord::Base
  belongs_to :kitchen
  has_many   :ingredients, dependent: :destroy
end
