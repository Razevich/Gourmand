class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.user_id
      redirect_to user_path(@user)
    else
      render "sessions/new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end