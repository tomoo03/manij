class ProjectCommentsController < ApplicationController
  before_action :move_to_sign_in

  def create
    @project_comment = ProjectComment.new(project_comment_params.merge(user_id: current_user.id))
    @project_comment.save
    respond_to do |format|
      format.json
    end
  end

  def destroy
    project_comment = ProjectComment.find(params[:id])
    project = project_comment.project_phase.project
    project_comment.destroy
    redirect_to team_project_path(project.team, project)
  end

  private
    def project_comment_params
      params.require(:project_comment).permit(:content, :user_id).merge(project_phase_id: params[:project_phase_id])
    end
end
