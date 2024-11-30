class ApplicationController < ActionController::Base
  # Devise will redirect to the root_path after sign-out
  def after_sign_out_path_for(resource_or_scope)
    reset_session # Clear session data
    root_path # or the path you want the user to go to after sign out
  end
end
