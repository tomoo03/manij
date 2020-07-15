class Api::PhasesController < ApplicationController

  def index

    @phase = Phase.find(params[:id])
    goal = @phase.goal
    goal.update_attributes(title: goal.title, phase_title: @phase.title)
  end
end