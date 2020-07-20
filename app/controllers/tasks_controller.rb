class TasksController < ApplicationController
  before_action :move_to_sign_in

  def new
    @phase = Phase.find(params[:phase_id])
    @task = Task.new
  end

  def create
    @phase = Phase.find(params[:phase_id])
    @task = Task.new(task_params)
    if @task.save
      redirect_to user_goal_path(current_user, @task.phase.goal)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @phase = @task.phase
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to user_goal_path(current_user, @task.phase.goal)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_goal_path(current_user, @task.phase.goal)
  end

  private
    def task_params
      params.require(:task).permit(:title, :task_flg).merge(phase_id: params[:phase_id])
    end
end
