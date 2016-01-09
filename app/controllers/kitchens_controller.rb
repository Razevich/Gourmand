class KitchenController < ApplicationController

  def show
    @kitchen = Kitchen.find_by(id: params[:id])
    render json: @kitchen, status: :ok
  end

  def create
    @user = User.find_by(id: params[:id])
    @kitchen = Kitchen.new(kitchen_params)
      if @kitchen.save
        @user << @kitchen
        render json: @kitchen, status: :ok
      else
        status: 400
      end
  end

  def delete
    @kitchen = Kitchen.find_by(id: params[:id])
    @kitchen.destroy
    status: :no_content
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end
end
