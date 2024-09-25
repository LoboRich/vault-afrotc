class Client < ApplicationRecord
    mount_uploader :birth_cert_img, ImageUploader
	mount_uploader :valid_id_img, ImageUploader
    mount_uploader :proof_of_income_img, ImageUploader
	mount_uploader :marriage_contract_img, ImageUploader
    mount_uploader :spa_img, ImageUploader
	mount_uploader :pdc_img, ImageUploader

    has_many :loans
    has_many :water_bills
end
