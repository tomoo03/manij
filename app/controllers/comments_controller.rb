class CommentsController < ApplicationController

  def create
    
  end
  private
    def comments_params
      params.require(:comment).permit(:content).merge(phase_id: params[:phase_id])
    end
end
