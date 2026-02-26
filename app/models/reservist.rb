class Reservist < ApplicationRecord
    belongs_to :user, optional: true
    has_many :adts, class_name: "Adt", foreign_key: "reservist_id", dependent: :destroy

    def full_name
      "#{last_name}, #{first_name} #{middle_name}"
    end
end
