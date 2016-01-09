class CookBookController < ApplicationController


  def show
    @cook_book = CookBook.find_by(id: params[:id])
    render json: @cook_book, status: :ok
  end
end
