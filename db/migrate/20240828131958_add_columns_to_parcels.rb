class AddColumnsToParcels < ActiveRecord::Migration[7.1]
  def change
    add_column :parcels, :lot_area, :string
    add_column :parcels, :house_area, :string
    add_column :parcels, :description, :text
    add_column :parcels, :selling_price, :float, default: 0.0
  end
end
