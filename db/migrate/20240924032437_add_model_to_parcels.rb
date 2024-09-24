class AddModelToParcels < ActiveRecord::Migration[7.1]
  def change
    add_column :parcels, :model, :string
  end
end
