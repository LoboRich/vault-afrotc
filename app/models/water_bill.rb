class WaterBill < ApplicationRecord
  belongs_to :client
  belongs_to :loan
  has_many :loan_parcels, through: :loan

  scope :paid, -> { where(status: 'paid') }
  scope :unpaid, -> { where(status: 'unpaid') } 
end
