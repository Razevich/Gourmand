class SessionsController < ApplicationController
  wrap_parameters include: User.attribute_names + [:password]

  def new

  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      render :json => {user: @user, kitchens: @user.kitchens}

    else
      @errors = errors.full_messages
      render json: @errors
    end
  end

  def destroy

  end

end
