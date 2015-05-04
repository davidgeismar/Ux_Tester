class SlidesController < ApplicationController
  before_action :set_project

  def new
   @slide = Slide.new(project_id: params[:project_id])
   question = @slide.questions.build
  end

  def show
    @slide = Slide.find(params[:id])
  end

  def create
    @slide = Slide.new(slide_params)
    @slide.project = Project.find(params[:project_id])
    if @slide.save
      redirect_to project_slide_path(@project, @slide), notice: 'Slide was successfully created.'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end
    def slide_params
      params.require(:slide).permit(:name, :description, :slide_type, :picture,
        :questions_attributes => [:id, :description])
    end
end
