class Api::PhasesController < ApplicationController

  def index
    @phase = Phase.find(params[:id])
    goal = @phase.goal
    goal.update(title: goal.title, phase_title: @phase.title)
  end

  def edit
    phase = Phase.find(params[:id])
    goal = phase.goal
    unless goal.user_id == current_user.id
      redirect_to new_user_session_path
    else
      goal.update(title: goal.title, phase_title: phase.title, user_id: current_user.id)
      redirect_to user_goal_path(current_user, goal)
    end
  end
end