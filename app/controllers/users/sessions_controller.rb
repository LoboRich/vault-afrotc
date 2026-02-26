class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)

    resource.generate_otp
    # SmsSender.send_sms(
    #   recipient: "09164745123",
    #   message: "Your OTP is #{resource.otp_code}"
    # )
    OtpMailer.new_otp(resource).deliver_now
    session[:otp_user_id] = resource.id
    sign_out resource

    redirect_to verify_otp_path
  end

  def destroy
    super
  end

  protected

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
