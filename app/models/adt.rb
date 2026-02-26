class Adt < ApplicationRecord
  belongs_to :reservist
  validate :six_months_between_applications, on: :create
  
  private

  def six_months_between_applications
    last_adt = reservist.adts.order(created_at: :desc).first
    return unless last_adt

    if last_adt.created_at > 6.months.ago
      errors.add(:base, "You can only submit a new application 6 months after your last one.")
    end
  end
end
