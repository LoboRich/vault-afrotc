class OtpMailer < ApplicationMailer
    default from: 'no-reply@afrotc.com'
  
    def new_otp(user)
      @reservist = user
      @email = "lobo.r0018@gmail.com"
  
      mail(
        # to: @reservist[:email],
        to: @email,
        subject: "Your OTP Code"
      )
    end
  end
  