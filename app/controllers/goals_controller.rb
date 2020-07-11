class GoalsController < ApplicationController
  before_action :set_goal, only: [:edit, :show]
  before_action :move_to_sign_in

  def new
    @goal = Goal.new
  end

  def create
    Goal.create(goal_params)
  end

  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
  end

  def index
    @goals = current_user.goals
  end

  def show
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

    def move_to_sign_in
      redirect_to root_path unless user_signed_in?
    end
end
