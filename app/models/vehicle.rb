class Vehicle < ApplicationRecord
    belongs_to :authorize_route
    belongs_to :franchise
end
