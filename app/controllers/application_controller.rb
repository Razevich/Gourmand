class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(token: params[:token])
  end
end
