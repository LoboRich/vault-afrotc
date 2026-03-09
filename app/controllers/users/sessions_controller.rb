class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)

    resource.generate_otp
    OtpMailer.new_otp(resource).deliver_now

    api = SmsApi.new
    if api.send_message(message: "Hi! Your OTP code is: #{resource.otp_code}", number: "09164745123")
      print 'Message sent!'
    else
      print 'Message sending failed!'
    end
    
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
