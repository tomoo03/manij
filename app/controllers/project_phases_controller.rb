class ProjectPhasesController < ApplicationController
  before_action :move_to_sign_in

  def new
    @project_phase = ProjectPhase.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project_phase = ProjectPhase.new(project_phase_params)
    if @project_phase.save
      redirect_to team_project_path(@project_phase.project.team, @project_phase.project)
    else
      render :new
    end
  end

  private
    def project_phase_params
      params.require(:project_phase).permit(:title).merge(project_id: params[:project_id])
    end
end
