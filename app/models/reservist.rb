class Reservist < ApplicationRecord
    belongs_to :user, optional: true

    def full_name
      "#{last_name}, #{first_name} #{middle_name}"
    end
end
