class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    before_action :authenticate_user!

    before_action :update_allowed_parameters, if: :devise_controller?


    private

    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :role, :status, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :role, :status, :email, :password, :current_password)}
    end

    def user_not_authorized(exception)
        policy_name = exception.policy.class.to_s.underscore
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referer || root_path)
    end
end
