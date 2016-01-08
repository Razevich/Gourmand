class CookBookController < ApplicationController
  def recipe
    @cook_book = CookBook.find_by(params[:cook_book_id])
    @recipe = Recipe.new()
  end
end
