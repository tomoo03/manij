class Api::ProjectPhasesController < ApplicationController
  def index
    @project_phase = ProjectPhase.find(params[:id])
    @project_phase.project.update(phase_title: @project_phase.title)
  end
end