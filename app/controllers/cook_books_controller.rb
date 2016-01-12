class CookBooksController < ApplicationController


  def show
    @cook_book = CookBook.find_by(id: params[:id])
    render :json => {recipes: @cook_book.recipes, cook_book: @cook_book}
  end

end
