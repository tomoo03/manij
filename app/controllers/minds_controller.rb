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

  def update
    mind = Mind.find(params[:id])
    mind.update_attributes(mind_params)
  end

  def destroy
    mind = Mind.find
    mind.destroy
  end

  private
    def mind_params
      params.require(:mind).permit(:title).merge(goal_id: params[:goal_id])
    end
end
