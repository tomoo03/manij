class ProjectsController < ApplicationController
  before_action :move_to_sign_in
  before_action :check_member, except: [:index, :new, :create]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.new
    @team = Team.find(params[:team_id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      @team = Team.find(params[:team_id])
      render :new
    end
  end

  def index
    @teams = current_user.teams
    @projects = Project.all
  end

  def show
    @project_phase = ProjectPhase.find_by(title: @project.phase_title)
    @project_phases = @project.project_phases.where.not(title: @project.phase_title).order("created_at ASC")
    @project_minds = @project.project_minds
    if @project_phase.present?
      @project_tasks = sort_created_at(@project_phase.project_tasks)
      @project_comments = sort_created_at(@project_phase.project_comments)
    end
  end

  def edit
    @team = @project.team
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      @team = @project.team
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :phase_title).merge(team_id: params[:team_id])
    end

    def check_member
      unless Team.find(params[:team_id]).users.exists?(id: current_user.id)
        redirect_to root_path
      end
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
