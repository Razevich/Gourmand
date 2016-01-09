class StepController < ApplicationController

  def new
  end

  def show
    @step = Step.find_by(id: params[:id])
    render json: @step, status: :ok
  end

  def create
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @step = Step.new(params[:description])
    if @step.save
      @recipe.steps << @step
      render json: @step, status: :ok
    else
      status: 400
    end
  end
end
