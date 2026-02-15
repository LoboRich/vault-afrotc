class Reservist < ApplicationRecord
    belongs_to :user, optional: true

    def full_name
      "#{rank} #{first_name} #{last_name}"
    end
end
