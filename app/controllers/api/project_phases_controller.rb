class Api::ProjectPhasesController < ApplicationController

  def index
    @project_phase = ProjectPhase.find(params[:id])
    project = @project_phase.project
    project.update(title: project.title, phase_title: @project_phase.title)
  end
end