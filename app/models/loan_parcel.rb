class LoanParcel < ApplicationRecord
  belongs_to :loan
  belongs_to :parcel
  belongs_to :water_bills, optional: true
end
