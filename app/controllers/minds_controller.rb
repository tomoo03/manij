class MindsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_current_user_goal, only: [:new]

  def new
    @mind = Mind.new
  end

  def create
    mind = Mind.new(mind_params)
    if mind.save
      redirect_to user_goal_path(current_user, mind.goal)
    else
      @goal = Goal.find(params[:goal_id])
      @mind = Mind.new
      render :new
    end
  end

  def edit
    @mind = Mind.find(params[:id])
    @goal = @mind.goal
  end

  def update
    mind = Mind.find(params[:id])
    if mind.update(mind_params)
      redirect_to user_goal_path(current_user, mind.goal)
    else
      render :edit
    end
  end

  def destroy
    mind = Mind.find(params[:id])
    mind.destroy
    redirect_to user_goal_path(current_user, mind.goal)
  end

  private
    def mind_params
      params.require(:mind).permit(:title).merge(goal_id: params[:goal_id])
    end
end
