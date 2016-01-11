class CookBooksController < ApplicationController


  def show
    @cook_book = CookBook.find_by(id: params[:id])
    render json: @cook_book.recipes
    render json: @cook_book
    # , status: :ok
  end

  # def destroy
  #   @cook_book = CookBook.find_by(id: params[:id])
  #   @cook_book.destroy
  #   head: :no_content #204 code, no content. This means it was good.
  # end
end
