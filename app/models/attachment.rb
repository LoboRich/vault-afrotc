class Attachment < ApplicationRecord
    belongs_to :vehicle
    mount_uploader :image, ImgUploader
end
