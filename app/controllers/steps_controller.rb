class StepsController < ApplicationController

  def new
  end

  def show
    @step = Step.find_by(id: params[:id])
    render :json => {step: @step, user_token: current_user.token}
  end

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @step = Step.new(params[:description])
    if @step.save
      @recipe.steps << @step
      render :json => {step: @step, user_token: current_user.token}
    else
      @errors = errors.full_messages
      render json: @errors
    end
  end
end
