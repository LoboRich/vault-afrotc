class InhouseLoanItem < ApplicationRecord
  belongs_to :inhouse_loan

  mount_uploader :receipt, ImageUploader
end
