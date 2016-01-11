class KitchenController < ApplicationController

  def show
    @kitchen = Kitchen.find_by(id: params[:id])
    render :json => {kitchen: @kitchen, user_token: current_user.token}
    # , status: :ok
  end

  def create
    @user = User.find_by(token: params[:token])
    @kitchen = Kitchen.new(kitchen_params)
      if @kitchen.save
        @user << @kitchen
        render :json => {kitchen: @kitchen, user_token: current_user.token}
        # , status: :ok
      else
        # status: 400
        @errors = errors.full_messages
      end
  end

  def delete
    @kitchen = Kitchen.find_by(id: params[:id])
    @kitchen.destroy
    render :json => {user_token: current_user.token}
    # status: :no_content
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
