class GoalsController < ApplicationController
  include ApplicationHelper
  before_action :set_goal, except: [:index, :new, :create]
  before_action :move_to_sign_in
  before_action :check_user, only: [:show, :edit, :update, :destroy]

  def new
    @goal = Goal.new
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
    @goal.destroy
  end

  def index
    @goals = current_user.goals.order("created_at DESC")
  end

  def show
    @phase = Phase.find_by(title: @goal.phase_title)
    @phases = @goal.phases.where.not(title: @goal.phase_title).order("created_at ASC")
    # phase_ids = @phases.pluck(:id)
    # @tasks = Task.where(task_flg: true)
  end

  def edit
  end

  def update
    goal.update(goal_params)
  end

  private

    def goal_params
      params.require(:goal).permit(:title, :phase_title).merge(user_id: current_user.id)
    end

    def set_goal
      @goal = current_user.goals.find(params[:id])
    end
end