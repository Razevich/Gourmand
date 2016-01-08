class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: @user

    else
      render "users/new"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
