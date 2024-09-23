class Parcel < ApplicationRecord
    belongs_to :subdivision
    has_many :loan_parcels, dependent: :destroy
    has_many :purchasers
end
