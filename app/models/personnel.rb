class Personnel < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  accepts_nested_attributes_for :user
end
