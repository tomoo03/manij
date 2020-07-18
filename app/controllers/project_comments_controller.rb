class ProjectCommentsController < ApplicationController
  before_action :move_to_sign_in

  def create
    @project_comment = ProjectComment.new(project_comment_params.merge(user_id: current_user.id))
    if @project_comment.save
      respond_to do |format|
        format.json
      end
    else
      render template: 'projects/show'
    end
  end

  private
    def project_comment_params
      params.require(:project_comment).permit(:content, :user_id).merge(project_phase_id: params[:project_phase_id])
    end
end
