class Loan < ApplicationRecord
  belongs_to :client
  has_many :LoanParcel
end
