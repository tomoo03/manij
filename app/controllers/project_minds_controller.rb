class ProjectMindsController < ApplicationController
  before_action :move_to_sign_in

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

  private
    def project_mind_params
      params.require(:project_mind).permit(:title).merge(project_id: params[:project_id])
    end
end
