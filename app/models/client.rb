class Client < ApplicationRecord
    has_many :loan
    has_many :water_bills
end
