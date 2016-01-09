class StepController < ApplicationController
  def new
  end

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @step = Step.new(params[:description])
    if @step.save
      @recipe.steps << @step
      render json: @step, status: :ok
    else

    end
  end
end
