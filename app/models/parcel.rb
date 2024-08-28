class Parcel < ApplicationRecord
    belongs_to :subdivision
    has_many :loan_parcels, dependent: :destroy
end
