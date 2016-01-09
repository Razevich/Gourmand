class NoteController < ApplicationController

  def show
    @step = Step.find_by(id: params[:id])
    render json: @step, status: :ok
  end

  def recipes
    @recipe = Recipe.find_by(id: params[:id])
    @note = Note.new(params[:description])
    if @note.save
      @recipe.notes << @note
      render json: @recipe, status: :ok
    else
      status: 400
    end
  end

  def steps
    @step = Step.find_by(id: params[:id])
    @note = Note.new(params[:description])
    if @note.save
      @step.notes << @note
      render json: @step, status: :ok
    else
      status: 400
    end
  end
end
