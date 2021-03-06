class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  
  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def move_to_sign_in
      redirect_to root_path unless user_signed_in?
    end

    def set_current_user_goal
      @goal = current_user.goals.find(params[:goal_id])
    end
end