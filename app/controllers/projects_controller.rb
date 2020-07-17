class ProjectsController < ApplicationController
  before_action :move_to_sign_in

  def new
    @project = Project.new
    @team = Team.find(params[:team_id])
  end

  def create
    project = Project.new(project_params)
    if project.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_phases = @project.project_phases
  end

  private
    def project_params
      params.require(:project).permit(:title, :phase_title).merge(team_id: params[:team_id])
    end
end
