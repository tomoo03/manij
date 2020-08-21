class TeamsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_team_member, only: [:show, :edit]

  def new
    @team = Team.new
    @team.users << current_user
  end
  
  def create
    @team = Team.new(team_params)
    if @team.save
      Membership.search(@team, current_user).update(activate: true)
      redirect_to action: :index
    else
      render :new
    end
  end

  def index
    @activate_teams = current_user.activated_teams
    @deactivate_teams = current_user.deactivated_teams
  end

  def show
  end
  
  def edit
    unless @team.admin_user_id == current_user.id
      redirect_to root_path and return
    end
    @activated_users = User.activated_users(@team, current_user)
  end

  def update
    params[:team][:user_ids] << current_user.id
    if @team.update(team_params)
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path(@team)
  end

  def activate_user
    @team = Team.find(params[:id])
    Membership.search(@team, current_user).update(activate: true)
    redirect_to team_path(@team)
  end

  def deactivate_user
    @team = Team.find(params[:id])
    Membership.search(@team, current_user).destroy
    redirect_to teams_path
  end

  private
    def team_params
      params.require(:team).permit(:name, user_ids: []).merge(admin_user_id: current_user.id)
    end

    def set_team
      @team = Team.find(params[:id])
    end

    def authenticate_team_member
      if Membership.search(@team, current_user).present?
        redirect_to root_path
      end
    end
end