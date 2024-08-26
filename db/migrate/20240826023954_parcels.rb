class Parcels < ActiveRecord::Migration[7.1]
  def change
    add_reference :parcels, :subdivision, type: :uuid, foreign_key: true
  end
end
