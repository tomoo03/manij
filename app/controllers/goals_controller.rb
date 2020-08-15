class GoalsController < ApplicationController
  before_action :move_to_sign_in
  before_action :set_goal, except: [:new, :create, :index]

  def new
    @goal = Goal.new
  end

  def create
    goal = Goal.new(goal_params)
    if goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def index
    @goals = current_user.goals.order("created_at DESC")
  end

  def show
    @phase = Phase.find_by(title: @goal.phase_title)
    @phases = @goal.phases.where.not(title: @goal.phase_title).order("created_at ASC")
    @minds = sort_created_at(@goal.minds)
    if @phase.present?
      @tasks = sort_created_at(@phase.tasks)
      @comment = Comment.new
      @comments = sort_created_at(@phase.comments)
    end
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goals_path
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path
  end

  private

    def goal_params
      params.require(:goal).permit(:title, :phase_title).merge(user_id: current_user.id)
    end

    def set_goal
      @goal = current_user.goals.find(params[:id])
    end
end