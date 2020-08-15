class CommentsController < ApplicationController
  before_action :move_to_sign_in
  
  def create
    @comment = Comment.create(comment_params)
    @phase = @comment.phase
    respond_to do |format|
      format.json
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    goal = comment.phase.goal
    comment.destroy
    redirect_to user_goal_path(current_user, goal)
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(phase_id: params[:phase_id])
    end
end
