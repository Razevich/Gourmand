class KitchensController < ApplicationController

  def show
    @kitchen = Kitchen.find_by(id: params[:id])
    render json: @kitchen
    # , status: :ok
  end

  def create
    @user = User.find_by(id: params[:id])
    @kitchen = Kitchen.new(kitchen_params)
      if @kitchen.save
        @user << @kitchen
        render json: @kitchen
        # , status: :ok
      else
        # status: 400
        @errors = errors.full_messages
      end
  end

  def search
    search_term = params[:kitchen]
    @kitchens = Kitchen.where("search_term LIKE (?)", "%#{search_term}%")
    render :json => {kitchens: @kitchens}
  end

  def delete
    @kitchen = Kitchen.find_by(id: params[:id])
    @kitchen.destroy
    # status: :no_content
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end
end
