class Api::ProjectTasksController < ApplicationController

  def index
    @project_task = ProjectTask.find(params[:id])
    if @project_task.task_flg == true
      @project_task.update(title: @project_task.title, task_flg: false)
    else
      @project_task.update(title: @project_task.title, task_flg: true)
    end
  end

  def create
    @user = User.find(params[:user_id])
    @project_task = ProjectTask.find(params[:id])
    @project_phase = @project_task.project_phase
    @task_flg = @project_task.task_flg
    @project_task.update(title: @project_task.title, task_flg: @task_flg, project_phase_id: @project_phase.id, user_id: @user.id)
  end
end