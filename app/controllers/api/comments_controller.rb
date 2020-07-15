class Api::CommentsController < ApplicationController

  def index
    # comment = Comment.new(content: params[:content], phase_id: params[:phase_id])
    comment = Comment.new(comment_params)
    comment.save
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(phase_id: params[:phase_id])
    end
end