class KitchensController < ApplicationController
  respond_to :json
  wrap_parameters include: Kitchen.attribute_names + [:name]

  def search
    search_term = params[:kitchen]
    @kitchens = Kitchen.where("name LIKE (?)", "%#{query}%")
    render :json => {kitchens: @kitchens}
  end

  def show
    @kitchen = Kitchen.find_by(id: params[:id])


    render :json => {kitchen: @kitchen, cook_book_id: @kitchen.cook_books.first.id, users: @kitchen.user_names, hashed_recipe: @kitchen.to_table, user_token: current_user.token}
  end

  def create
    @kitchen = current_user.created_kitchens.new(kitchen_params)
      if @kitchen.save
        @kitchen.users << current_user
        render :json => {kitchen: @kitchen, user_name: current_user.name user_token: current_user.token}
      else
        @errors = errors.full_messages
        render json: @errors
      end
  end

  def delete
    @kitchen = Kitchen.find_by(id: params[:id])
    @kitchen.destroy
    render :json => {user_token: current_user.token}
  end

  def join
    @kitchen = Kitchen.find_by(id: params[:id])
    if current_user
      current_user.kitchens << @kitchen
      render :json => {user_token: current_user.token}
    end
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end
end


