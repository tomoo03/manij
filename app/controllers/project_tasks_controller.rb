class ProjectTasksController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_project_task, only: [:edit, :update, :destroy, :change_task_flg]

  def new
    @project_task = ProjectTask.new
    @project_phase = ProjectPhase.find(params[:project_phase_id])
    @users = @project_phase.project.team.users
  end

  def create
    if params[:project_task][:user_id].present?
      @project_task = ProjectTask.new(project_task_params)
      if @project_task.save
        redirect_to team_project_path(@project_task.project_phase.project.team, @project_task.project_phase.project)
      else
        render :new and return
      end
    else
      @project_task = ProjectTask.new
      @project_phase = ProjectPhase.find(params[:project_phase_id])
      @users = @project_phase.project.team.users
      render :new
    end
  end

  def edit
    @project_phase = @project_task.project_phase
    @users = @project_phase.project.team.users
  end

  def update
    if params[:project_task][:user_id].present?
      if @project_task.update(project_task_params)
        redirect_to team_project_path(@project_phase.project.team, @project_phase.project)
      else
        @project_phase = @project_task.project_phase
        @users = @project_phase.project.team.users
        render :edit and return
      end
    else
      @project_phase = @project_task.project_phase
      @users = @project_phase.project.team.users
      render :edit
    end
  end

  def destroy
    project = @project_task.project_phase.project
    @project_task.destroy
    redirect_to team_project_path(project.team, project)
  end

  def change_task_flg
    if @project_task.task_flg == true
      @project_task.update(task_flg: false)
    else
      @project_task.update(task_flg: true)
    end
    respond_to do |format|
      format.json
    end
  end

  private

    def set_project_task
      @project_task = ProjectTask.find(params[:id])
    end

    def project_task_params
      params.require(:project_task).permit(:title, :task_flg, :user_id).merge(project_phase_id: params[:project_phase_id])
    end
end
