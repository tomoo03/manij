class PhasesController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_current_user_goal, only: [:new]
  before_action :set_phase, only: [:edit, :update, :destroy]

  def new
    @phase = Phase.new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @phase = Phase.new(phase_params)
    if @phase.save
      if @phase.goal.phase_title.blank?
        goal = Goal.find(params[:goal_id])
        goal.update(phase_title: @phase.title)
      end
      redirect_to user_goal_path(current_user, @phase.goal)
    else
      render :new
    end
  end

  def edit
    @goal = @phase.goal
  end

  def update
    if @phase.update(phase_params)
      redirect_to user_goal_path(@phase.goal.user, @phase.goal)
    else
      @goal = @phase.goal
      render :edit
    end
  end

  def destroy
    goal = @phase.goal
    if @phase.title == @phase.goal.phase_title
      @phase.goal.update_attribute(:phase_title, nil)
    end
    @phase.destroy
    redirect_to user_goal_path(goal.user, goal)
  end

  private
    def phase_params
      params.require(:phase).permit(:title).merge(goal_id: params[:goal_id])
    end

    def set_phase
      @phase = Phase.find(params[:id])
    end
end
