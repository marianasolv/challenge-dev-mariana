class ProjectsController < ApplicationController
  before_action :authenticate_user
  
    # GET /projects
  def index
  	@projects = Project.all

    # Recover the user in the current session
    @current_user = User.find session[:user_id]

    current_user_id = @current_user.id

    # Only show the user's projects
    @projects = Project.where(user_id: current_user_id)
  end

  # GET /projects/new
  def new
    @project = Project.new 
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    # Recover the user in the current session
    @current_user = User.find session[:user_id]
    @project.user_id = @current_user.id
    
    if @project.save
      redirect_to @project, notice: 'Project created successfully!'
    else
      render :new
    end
  end

  # GET /projects/1
  def show
  	@project = Project.find(params[:id])
  end

  # GET /projects/1/edit
  def edit
  	@project = Project.find(params[:id])
  end

  # PATCH/PUT /projects/1
  def update
  	@project = Project.find(params[:id])
  	if @project.update_attributes(project_params)
  		redirect_to @project, notice: 'Project has been updated!'
  	else
  		render :edit
  	end
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])

    # Delete all bugs from this project
    Bug.where(project_id: @project.id).each do |bug|
      bug.destroy
    end

    @project.destroy
    redirect_to projects_path
  end

  # Params allowed to create a new project
  private
  def project_params
  	params.require(:project).permit(:name, :description, :budget, :start_date)
  end
