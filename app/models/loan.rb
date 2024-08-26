class Loan < ApplicationRecord
  belongs_to :client
  has_many :loan_parcels
  
  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= 'for-review'
  end
end
