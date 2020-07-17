class TasksController < ApplicationController
  before_action :move_to_sign_in

  def new
    @phase = Phase.find(params[:phase_id])
    @task = Task.new
  end

  def create
    phase = Phase.find(params[:phase_id])
    task = Task.new(task_params)
    if task.save
      redirect_to user_goal_path(current_user, task.phase.goal)
    else
      @phase = Phase.find(params[:phase_id])
      @task = Task.new
      render :new
    end
  end

  def edit

  end

  private
    def task_params
      params.require(:task).permit(:title, :task_flg).merge(phase_id: params[:phase_id])
    end
end
