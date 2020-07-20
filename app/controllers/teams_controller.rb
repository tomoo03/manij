class TeamsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_team, only: [:show, :edit, :update]

  def new
    @team = Team.new
    @team.users << current_user
  end
  
  def create
    team = Team.new(team_params)
    if team.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def index
    @teams = current_user.teams
  end

  def show
  end
  
  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    if team.update(team_params)
      redirect_to team_path(team)
    else
      render :edit
    end
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to teams_path(team)
  end

  private
    def team_params
      params.require(:team).permit(:name, user_ids: [])
    end

    def set_team
      @team = current_user.teams.find(params[:id])
    end
end
