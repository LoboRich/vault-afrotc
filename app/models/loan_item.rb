class LoanItem < ApplicationRecord
  belongs_to :loan, optional: true
end
