class GoalsController < ApplicationController
  include ApplicationHelper
  before_action :set_goal, only: [:edit, :show]
  before_action :move_to_sign_in

  def new
  end

  def create
    goal = Goal.new(goal_params)
    if goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
  end

  def index
    @goals = current_user.goals.order("created_at DESC")
  end

  def show
    @phases = @goal.phases.order("created_at ASC")
    # phase_ids = @phases.pluck(:id)
    # @tasks = Task.where(task_flg: true)
  end

  def edit
  end

  def update
    goal = Goal.find(params[:id])
    goal.update(goal_params)
  end

  private

    def goal_params
      params.require(:goal).permit(:title, :phase_title).merge(user_id: current_user.id)
    end

    def set_goal
      @goal = Goal.find(params[:id])
    end
end