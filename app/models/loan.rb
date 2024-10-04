class Loan < ApplicationRecord
  belongs_to :client
  has_many :loan_parcels, dependent: :destroy
  has_many :loan_items, dependent: :destroy
  has_many :parcels, through: :loan_parcels, dependent: :destroy
  has_many :payment_histories, dependent: :destroy
  has_one :water_bill, dependent: :destroy
  has_one :inhouse_loan, dependent: :destroy
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
