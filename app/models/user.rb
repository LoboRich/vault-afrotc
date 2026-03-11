class User < ApplicationRecord
  # has_one :personnel, dependent: :destroy
  has_one_attached :photo
  has_one :reservist, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  before_save :resize_and_convert_photo, if: -> { photo.attached? }

  def role
    reservist.role
  end
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

  private

  def resize_and_convert_photo
    require "image_processing/mini_magick"

    max_bytes = 10.megabytes
    return if photo.blob.byte_size <= max_bytes

    photo.open(tmpdir: Dir.tmpdir) do |file|
      processed = ImageProcessing::MiniMagick
        .source(file)
        .resize_to_limit(2000, 2000)  # max dimensions
        .convert("jpg")               # ensures JPEG format
        .call

      photo.attach(
        io: File.open(processed.path),
        filename: "#{photo.filename.base}.jpg",
        content_type: "image/jpeg"
      )
    end
  rescue => e
    Rails.logger.error "Photo processing failed: #{e.message}"
  end
end
