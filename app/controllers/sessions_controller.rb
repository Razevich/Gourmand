class SessionsController < ApplicationController

  def new

  end

  def create
    p "Username:"
    p params[:username]
    p "params:"
    p params
    p "Password"
    p params[:password]

    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      render json: @user
      render json: @user.kitchens
      # status: :ok
    else
      p params
      render json: "Nope"
      # status: :unprocessable_entity # error 422 code
    end
  end

  def destroy

    # status: :no_content #204 code
  end

end
