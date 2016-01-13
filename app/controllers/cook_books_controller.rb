class CookBooksController < ApplicationController
  respond_to :json
  wrap_parameters include: CookBook.attribute_names + [:name]


  def show
    @cook_book = CookBook.find_by(id: params[:id])
    render :json => {recipes: @cook_book.recipes, cook_book: @cook_book}
  end

  # def search
  #   search_term = params[:recipe]
  #   @recipes = Recipe.where("first_name LIKE (?)", "%#{search_term}%"
  #   render json: @recipes
  # end

end
