class UsersController < ApplicationController
  respond_to :json
  wrap_parameters include: User.attribute_names + [:password, :username, :email]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        render json: @user

        p current_user
      else
        # status: 400
        @errors = errors.full_messages
        render json: @errors
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
