class ProjectMindsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_project_mind, only: [:edit, :update, :destroy]

  def new
    @project_mind = ProjectMind.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project_mind = ProjectMind.new(project_mind_params)
    if @project_mind.save
      redirect_to team_project_path(@project_mind.project.team, @project_mind.project)
    else
      @project = Project.find(params[:project_id])
      render :new
    end
  end

  def edit
    @project = @project_mind.project
  end

  def update
    if @project_mind.update(project_mind_params)
      redirect_to team_project_path(@project_mind.project.team, @project_mind.project)
    else
      render :edit
    end
  end

  def destroy
    project = @project_mind.project
    @project_mind.destroy
    redirect_to team_project_path(project.team, project)
  end

  private
    def project_mind_params
      params.require(:project_mind).permit(:title).merge(project_id: params[:project_id])
    end

    def set_project_mind
      @project_mind = ProjectMind.find(params[:id])
    end
end
