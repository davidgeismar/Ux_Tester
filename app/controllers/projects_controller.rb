class ProjectsController < ApplicationController
  before_action :is_connected
  before_action :set_project , only: [:show, :edit, :update, :destroy]


  # GET /projects
  def index
    @projects = current_user.projects
  end

  # GET /projects/1
  def show
    @slides = @project.slides

  end

  # GET /projects/new
  def new
      @project = Project.new
    slide = @project.slides.build
     slide.questions.build
  end

  # GET /projects/1/edit
  def edit
     @slides = @project.slides
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find_by_id(params[:id])
      if @project.nil?
        flash[:alert] = "Ce projet n'existe pas"
        redirect_to projects_path
        return
      end
    end

    def correct_user
      @user = Project.find(params[:id]).user_id
        if @user == current_user.id
        else
          flash[:alert] = "Vous n'avez pas accès à ce projet"
          redirect_to root_path
        end
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :description, :public, :status, :url, :mode,
        :slides_attributes => [:id, :name, :description, :slide_type, :picture,
          :questions_attributes => [:id, :description]
          ])
    end
end
