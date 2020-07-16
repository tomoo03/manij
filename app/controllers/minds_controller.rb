class MindsController < ApplicationController
  before_action :move_to_sign_in

  def new
    @goal = Goal.find(params[:goal_id])
    @mind = Mind.new
  end

  def create
    mind = Mind.new(mind_params)
    if mind.save
      redirect_to "/goals/#{params[:goal_id]}"
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
