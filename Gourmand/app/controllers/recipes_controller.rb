class RecipeController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(user_id: current_user.id, name: params[:name])
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end
end
