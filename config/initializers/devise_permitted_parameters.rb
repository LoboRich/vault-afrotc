# config/initializers/devise_permitted_parameters.rb
Rails.application.config.to_prepare do
  DeviseController.class_eval do
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
      devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
    end
  end
end