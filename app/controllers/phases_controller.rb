class PhasesController < ApplicationController
  before_action :move_to_sign_in

  def new
    @goal = Goal.find(params[:goal_id])
    @phase = Phase.new
  end

  def create
    phase = Phase.new(phase_params)
    if phase.save
      if phase.goal.phase_title.nil?
        goal = Goal.find(params[:goal_id])
        goal.update_attributes(title: goal.title, phase_title: phase.title)
      end
      redirect_to "/goals/#{phase.goal.id}"
    else
      @goal = Goal.find(params[:goal_id])
      @phase = Phase.new
      render :new
    end
  end

  def edit
    @phase = Phase.find(params[:id])
    @goal = @phase.goal
  end

  def update
    phase = Phase.find(params[:id])
    if phase.update(phase_params)
      redirect_to "/goals/#{phase.goal.id}"
    else
      render :edit
    end
  end

  def destroy
    phase = Phase.find(params[:id])
    phase.destroy
  end

  private
    def phase_params
      params.require(:phase).permit(:title).merge(goal_id: params[:goal_id])
    end
end
