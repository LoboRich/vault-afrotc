class Loan < ApplicationRecord
  belongs_to :client
  has_many :loan_parcels
  has_many :loan_items
  has_many :parcels, through: :loan_parcels
  has_many :payment_histories
  has_one :water_bill
  after_initialize :set_default_status, if: :new_record?

  def display_parcels
    parcels.map do |parcel|
      "#{parcel.subdivision.short_code} Block: #{parcel.block}, Lot: #{parcel.lot}"
    end
  end
  private

  def set_default_status
    self.status ||= 'for-review'
  end
end
