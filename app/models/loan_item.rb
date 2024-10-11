class LoanItem < ApplicationRecord
  belongs_to :loan, optional: true
  has_one :payment_history, dependent: :destroy

  mount_uploaders :receipt_img, ImageUploader

end
