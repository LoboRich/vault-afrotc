class ApplicationController < ActionController::Base
  protected

  def after_sign_out_path_for(resource_or_scope)
    Rails.logger.info "CUSTOM SIGN OUT PATH CALLED"
    new_user_session_path
  end
end
