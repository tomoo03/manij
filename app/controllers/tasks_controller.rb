class TasksController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_task, only: [:edit, :update, :destroy, :change_task_flg]

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
    @phase = @task.phase
  end

  def update
    if @task.update(task_params)
      redirect_to user_goal_path(current_user, @task.phase.goal)
    else
      render :edit
    end
  end

  def destroy
    goal = @task.phase.goal
    @task.destroy
    redirect_to user_goal_path(current_user, goal)
  end

  def change_task_flg
    if @task.task_flg == true
      @task.update(task_flg: false)
    else
      @task.update(task_flg: true)
    end
    respond_to do |format|
      format.json
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :task_flg).merge(phase_id: params[:phase_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end
end