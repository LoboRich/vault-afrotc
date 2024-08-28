class LoanItem < ApplicationRecord
  belongs_to :loan, optional: true
  has_one :payment_history
end
