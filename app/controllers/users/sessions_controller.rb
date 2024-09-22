# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def create
    super do |resource|
      History.create(user_id: resource.id, description: "Signed in") if resource.persisted?
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def destroy
    History.create(user_id: current_user.id, description: "Signed out") if user_signed_in?
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
