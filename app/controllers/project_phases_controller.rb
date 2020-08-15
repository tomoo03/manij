class ProjectPhasesController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_project_phase, only: [:edit, :update, :destroy]

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

  def edit
    @project = @project_phase.project
  end

  def update
    if @project_phase.update(project_phase_params)
      redirect_to team_project_path(@project_phase.project.team, @project_phase.project)
    else
      render :edit
    end
  end

  def destroy
    project = @project_phase.project
    if @project_phase.title == project.phase_title
      project.update(:phase_title, nil)
    end
    @project_phase.destroy
    redirect_to team_project_path(project.team, project)
  end

  private
    def project_phase_params
      params.require(:project_phase).permit(:title).merge(project_id: params[:project_id])
    end

    def set_project_phase
      @project_phase = ProjectPhase.find(params[:id])
    end
end
