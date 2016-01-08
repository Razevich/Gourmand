class Recipe < ActiveRecord::Base
  belongs_to :cook_book
  belongs_to :user
  has_many   :recipe_ingredients
  has_many   :ingredients, through: :recipe_ingredients
  has_many   :steps
  has_many   :notes
end
