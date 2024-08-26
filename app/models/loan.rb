class Loan < ApplicationRecord
  belongs_to :client
  has_many :loan_parcels
end
