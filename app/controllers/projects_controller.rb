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
    @project_phases = @project.project_phases.order("created_at ASC")
  end

  def edit
    @project = Project.find(params[:id])
    @project_phases = @project.project_phases
    @task_ary = []
    @project_phases.each do |project_phase|
      @task_ary += project_phase.project_tasks
    end
    @team_members = @project.team.users
  end

  private
    def project_params
      params.require(:project).permit(:title, :phase_title).merge(team_id: params[:team_id])
    end
end
