class ProjectCommentsController < ApplicationController
  before_action :move_to_sign_in

  private
    def project_comment_params
      params.require(:project_comment).permit(:content, user_id).merge(project_phase_id: params[:project_phase_id])
    end
end
