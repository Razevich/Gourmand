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
    @users = @kitchen.users
    @usernames = []
    @recipe_array = []
    @kitchen.cook_books.first.recipes.each do |recipe|
      recipe_array << convert_table(recipe)
    end

    @users.each do |user|
      @usernames << user.username
    end
    render :json => {kitchen: @kitchen, cook_book_id: @kitchen.cook_books.first.id, users: @usernames, recipe: @recipe_array, user_token: current_user.token}
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

 def convert_table(data)
    array = []
    counter = 1
      until counter == data.length
        array << data[0].zip(data[counter])
        counter +=1
      end

    array.each do |i|
      i = Hash[i.map {|key, value| [key, value]}]
    end
  return i
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end
end
