class WaterBill < ApplicationRecord
  belongs_to :client
  belongs_to :loan
  has_many :loan_parcels, through: :loan
end
