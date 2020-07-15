class Api::CommentsController < ApplicationController

  def index
    comment = Comment.new(content: params[:content], phase_id: params[:phase_id])
    comment.save
  end

  private
    def comments_params
      params.require(:comment).permit(:content).merge(phase_id: params[:phase_id])
    end
end