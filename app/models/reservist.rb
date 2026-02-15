class Reservist < ApplicationRecord
    belongs_to :user, optional: true
end
