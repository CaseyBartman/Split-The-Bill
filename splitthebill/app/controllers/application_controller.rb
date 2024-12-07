class ApplicationController < ActionController::Base
  # Devise will redirect to the root_path after sign-out
  def after_sign_out_path_for(resource_or_scope)
    reset_session # Clear session data
    flash[:notice] = "You have successfully logged out."
    root_path # or the path you want the user to go to after sign out
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
