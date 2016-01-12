class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_username(params[:username])
    p params
    if @user && @user.authenticate(params[:password])
      render json: @user
      render json: @user.kitchens
      # status: :ok
    else
      render json: "Invalid username or password"
      # status: :unprocessable_entity # error 422 code
    end
  end

  def destroy
    session.delete(:user_id)
    # status: :no_content #204 code
  end

end
