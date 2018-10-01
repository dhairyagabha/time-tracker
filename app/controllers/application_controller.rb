class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_workspace, :set_user_time_zone, :set_timer, if: :user_signed_in?


  protected
  def set_workspace
    @workspace = current_user.workspace
  end
  def set_timer
    @timer = @workspace.timers.active.any? ? @workspace.timers.active.first : @workspace.timers.new
  end
  def set_user_time_zone
    Time.zone = current_user.timezone if current_user.present?
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
