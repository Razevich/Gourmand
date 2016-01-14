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
    @hashed_table = @kitchen.to_table

    convert_table(@kitchen.recipe_ids, @kitchen.recipe_names)

    render :json => {kitchen: @kitchen, cook_book_id: @kitchen.cook_books.first.id, users: @kitchen.user_names, hashed_recipe: @kitchen, user_token: current_user.token}
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
      if @kitchen.save
        current_user.kitchens << @kitchen
        render :json => {kitchen: @kitchen, user_token: current_user.token}
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
