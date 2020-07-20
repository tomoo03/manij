class ProjectsController < ApplicationController
  before_action :move_to_sign_in
  before_action :member_check, except: [:index, :new, :create]

  def new
    @project = Project.new
    @team = current_user.teams.find(params[:team_id])
  end

  def create
    project = Project.new(project_params)
    if project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def index
    @teams = current_user.teams
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @project_phase = ProjectPhase.find_by(title: @project.phase_title)
    @project_phases = @project.project_phases.where.not(title: @project.phase_title).order("created_at ASC")
  end

  def edit
    @project = Project.find(params[:id])
    @team = @project.team
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :phase_title).merge(team_id: params[:team_id])
    end

    def member_check
      team = Team.find(params[:team_id])
      @user = team.users.find_by(id: current_user.id)
      if @user.nil?
        redirect_to root_path
      end
    end
end
