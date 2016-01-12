class ShoppingListsController < ApplicationController

  def show
    @shopping_list = ShoppingList.find_by(id: params[:id])
  end

  def ingredients
    @shopping_list = ShoppingList.find_by(id: params[:id])
    render json: @shopping_list.ingredients
  end

end
