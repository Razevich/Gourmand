class RecipesController < ApplicationController

  def create
    @cook_book = CookBook.find_by(id: params[:cook_book_id])
    @recipe.new(user_id: current_user.id, cook_book_id: @cook_book.id, name: params[:name] )
    if @recipe.save
      render :json => {recipe: @recipe, user_token: current_user.token}
    else
      @errors = errors.full_messages
      render :json @errors
    end
  end

  def steps
    @recipe = Recipe.find_by(id: params[:id])
    render :json => {recipe: @recipe, steps: @recipe.steps}
  end

  def ingredients
    @recipe = Recipe.find_by(id: params[:id])
    render :json => {ingredients: @recipe.ingredients, recipe: @recipe, steps: @steps}
  end

  # def edit
  #   @recipe = Recipe.find_by(id: params[:id])
  # end

  # def update
  #   @recipe = Recipe.find_by(id: params[:id])
  #   @recipe.update(name: params[:name])
  # end
end
