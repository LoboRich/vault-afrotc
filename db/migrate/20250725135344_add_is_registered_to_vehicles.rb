class AddIsRegisteredToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :is_registered, :boolean, default: false
  end
end
