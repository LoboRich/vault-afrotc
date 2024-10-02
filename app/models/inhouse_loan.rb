class InhouseLoan < ApplicationRecord
  belongs_to :client
  belongs_to :loan
  has_many :inhouse_loan_items
end
