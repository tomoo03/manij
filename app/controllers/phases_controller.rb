class PhasesController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_current_user_goal, only: [:new]

  def new
    @phase = Phase.new
    @goal = Goal.find(params[:goal_id])
  end

  def create
    @phase = Phase.new(phase_params)
    if @phase.save
      if @phase.goal.phase_title.nil?
        goal = Goal.find(params[:goal_id])
        goal.update(title: goal.title, phase_title: @phase.title)
      end
      redirect_to user_goal_path(current_user, @phase.goal)
    else
      render :new
    end
  end

  def edit
    @phase = Phase.find(params[:id])
    @goal = @phase.goal
  end

  def update
    @phase = Phase.find(params[:id])
    if @phase.update(phase_params)
      redirect_to user_goal_path(@phase.goal.user, @phase.goal)
    else
      @goal = @phase.goal
      render :edit
    end
  end

  def destroy
    @phase = Phase.find(params[:id])
    if @phase.title == @phase.goal.phase_title
      @phase.goal.update_attribute(:phase_title, nil)
    end
    @phase.destroy
    redirect_to user_goal_path(@phase.goal.user, @phase.goal)
  end

  private
    def phase_params
      params.require(:phase).permit(:title).merge(goal_id: params[:goal_id])
    end
end