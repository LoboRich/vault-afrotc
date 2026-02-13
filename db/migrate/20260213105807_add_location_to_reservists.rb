class AddLocationToReservists < ActiveRecord::Migration[7.1]
  def change
    add_column :reservists, :location, :string
    add_column :reservists, :is_active, :boolean
  end
end
