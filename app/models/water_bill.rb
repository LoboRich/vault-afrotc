class WaterBill < ApplicationRecord
  belongs_to :client
  belongs_to :loan
end
