class ProjectTasksController < ApplicationController
  before_action :move_to_sign_in

  def new
    @project_task = ProjectTask.new
    @project_phase = ProjectPhase.find(params[:project_phase_id])
    @project = @project_phase.project
    @users = @project.team.users
  end

  def create
    @project_task = ProjectTask.new(project_task_params)
    if @project_task.save
      redirect_to team_project_path(@project_task.project_phase.project.team, @project_task.project_phase.project)
    else
      render :new
    end
  end

  private
    def project_task_params
      params.require(:project_task).permit(:title, :task_flg, :user_id).merge(project_phase_id: params[:project_phase_id])
    end
end
