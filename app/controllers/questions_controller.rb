class QuestionsController < ApplicationController
  before_action :set_slide

  def new
   @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.slide = @slide.id
    if @slide.save
      redirect_to project_slide_path(@project, @slide), notice: 'Slide was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.find(params[:slide_id])
    end
    def slide_params
      params.require(:question).permit(:description)
    end
end
