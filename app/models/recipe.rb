class Recipe < ActiveRecord::Base
  belongs_to :cook_book
  belongs_to :user
  has_many   :recipe_ingredients
  has_many   :ingredients, through: :recipe_ingredients
  has_many   :steps, dependent: :destroy
  has_many   :notes, dependent: :destroy

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search]).order("created_at DESC")
    else
      @recipes = []
    end
  end
end
