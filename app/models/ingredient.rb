class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recies, through: :recipe_ingredients
  belongs_to :shopping_list

end
