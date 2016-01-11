class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])

      render json: @user
      render json: @user.kitchens
      # status: :ok
    else
      render json: "Nope"
      # status: :unprocessable_entity # error 422 code
    end
  end

  def destroy

    # status: :no_content #204 code
  end

end
