class User < ApplicationRecord
  has_one :personnel, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def generate_otp
    self.otp_code = rand(100000..999999).to_s
    self.otp_sent_at = Time.current
    save!
  end

  def otp_expired?
    otp_sent_at < 10.minutes.ago
  end

  def verify_otp(code)
    return false if otp_expired?
    otp_code == code
  end
end
