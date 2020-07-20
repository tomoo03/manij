class CommentsController < ApplicationController
  before_action :move_to_sign_in
  
  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      @phase = @comment.phase
      respond_to do |format|
        format.json
      end
    else
      phase = Phase.find(params[:phase_id])
      @goal = phase.goal
      @phases = @goal.phases.order("created_at ASC")
      render template: 'goals/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    goal = comment.phase.goal
    comment.destroy
    redirect_to user_goal_path(current_user, goal)
  end

  private
    def comments_params
      params.require(:comment).permit(:content).merge(phase_id: params[:phase_id])
    end
end
