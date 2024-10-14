class InhouseLoanItem < ApplicationRecord
  belongs_to :inhouse_loan

  mount_uploaders :receipt, ImageUploader
end
