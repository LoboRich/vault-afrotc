class Client < ApplicationRecord
    mount_uploaders :birth_cert_img, ImageUploader
	mount_uploaders :valid_id_img, ImageUploader
    mount_uploaders :proof_of_income_img, ImageUploader
	mount_uploaders :marriage_contract_img, ImageUploader
    mount_uploaders :spa_img, ImageUploader
	mount_uploaders :pdc_img, ImageUploader
    # mount_uploader :doc, ImageUploader

    has_many :loans
    has_many :water_bills
end
