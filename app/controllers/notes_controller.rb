class NotesController < ApplicationController

  def show
    @step = Step.find_by(id: params[:id])
    render json: @step
    # , status: :ok
  end

  def recipes
    @recipe = Recipe.find_by(id: params[:id])
    @note = Note.new(params[:description])
    if @note.save
      @recipe.notes << @note
      render json: @recipe
    else
      @errors = errors.full_messages
    end
  end

  def steps
    @step = Step.find_by(id: params[:id])
    @note = Note.new(params[:description])
    if @note.save
      @step.notes << @note
      render json: @step

    else
      @errors = errors.full_messages
      render json: @errors
    end
  end
end
