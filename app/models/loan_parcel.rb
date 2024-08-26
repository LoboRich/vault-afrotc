class LoanParcel < ApplicationRecord
  belongs_to :loan
  belongs_to :parcel
end
