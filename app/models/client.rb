class Client < ApplicationRecord
    has_many :loans
    has_many :water_bills
end
