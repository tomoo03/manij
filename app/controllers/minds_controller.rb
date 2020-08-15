class MindsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_current_user_goal, only: [:new]
  before_action :set_mind, only: [:edit, :update, :destroy]

  def new
    @mind = Mind.new
  end

  def create
    @mind = Mind.new(mind_params)
    if @mind.save
      redirect_to user_goal_path(current_user, @mind.goal)
    else
      @goal = Goal.find(params[:goal_id])
      render :new
    end
  end

  def edit
    @goal = @mind.goal
  end

  def update
    if @mind.update(mind_params)
      redirect_to user_goal_path(current_user, @mind.goal)
    else
      render :edit
    end
  end

  def destroy
    goal = @mind.goal
    @mind.destroy
    redirect_to user_goal_path(current_user, goal)
  end

  private
    def mind_params
      params.require(:mind).permit(:title).merge(goal_id: params[:goal_id])
    end

    def set_mind
      @mind = Mind.find(params[:id])
    end
end
