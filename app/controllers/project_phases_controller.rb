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

  def edit
    @project_phase = ProjectPhase.find(params[:id])
    @project = @project_phase.project
  end

  def update
    @project_phase = ProjectPhase.find(params[:id])
    if @project_phase.update(project_phase_params)
      redirect_to team_project_path(@project_phase.project.team, @project_phase.project)
    else
      render :edit
    end
  end

  def destroy
    @project_phase = ProjectPhase.find(params[:id])
    @project = @project_phase.project
    if @project_phase.title == @project_phase.project.phase_title
      @project_phase.project.update_attribute(:phase_title, nil)
    end
    @project_phase.destroy
    redirect_to team_project_path(@project.team, @project)
  end

  private
    def project_phase_params
      params.require(:project_phase).permit(:title).merge(project_id: params[:project_id])
    end
end
