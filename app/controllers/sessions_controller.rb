class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.user_id
      status: :ok
    else
      status: :unprocessable_entity # error 422 code
    end
  end

  def destroy
    session.delete(:user_id)
    status: :no_content #204 code
  end

end
