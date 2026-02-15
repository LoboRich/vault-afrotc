class OtpController < ApplicationController
  def new
  end

  def create
    user = User.find(session[:otp_user_id])

    if user.verify_otp(params[:otp_code])
      user.update(otp_verified: true)
      sign_in(user)
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash[:alert] = "Invalid or expired OTP"
      render :new
    end
  end
end
