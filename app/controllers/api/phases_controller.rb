class Api::PhasesController < ApplicationController

  def index
    @phase = Phase.find(params[:id])
    @phase.goal.update(phase_title: @phase.title)
  end

  def edit
    phase = Phase.find(params[:id])
    goal = phase.goal
    if goal.user_id == current_user.id
      goal.update(phase_title: phase.title)
      redirect_to user_goal_path(current_user, goal)
    else
      redirect_to new_user_session_path
    end
  end

  def update
    project_phase = ProjectPhase.find(params[:id])
    project = project_phase.project
    users = project.team.users
    if users.include?(current_user)
      project.update(phase_title: project_phase.title)
      redirect_to team_project_path(project.team, project)
    else
      redirect_to new_user_session_path
    end
  end
end