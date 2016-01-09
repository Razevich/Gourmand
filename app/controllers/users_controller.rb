class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to |format| do
      if @user.save
        session[:user_id] = @user.id
        format.json {render action: 'show', status: :created, location: @user}
      else
        "whoops"
      end
    end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
