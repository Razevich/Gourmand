class RecipeController < ApplicationController

  def create
    @cook_book = CookBook.find_by(id: params[:cook_book_id])
    @recipe.new(user_id: current_user.id, cook_book_id: @cook_book.id, name: params[:name] )
    if @recipe.save
      render json: @recipe, status: :ok
    else
      status: 400
    end
  end

  def steps
    @recipie = Recipe.find_by(id: params[:id])
    render json: @recipe.steps, status: :ok
  end

  def ingredients
    @recipie = Recipe.find_by(id: params[:id])
    render json: @recipe.ingredients, status: :ok
  end

  # def edit
  #   @recipe = Recipe.find_by(id: params[:id])
  # end

  # def update
  #   @recipe = Recipe.find_by(id: params[:id])
  #   @recipe.update(name: params[:name])
  # end
end
