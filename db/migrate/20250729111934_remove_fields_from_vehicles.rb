class RemoveFieldsFromVehicles < ActiveRecord::Migration[7.1]
  def change
    remove_column :vehicles, :denomination, :string
    remove_column :vehicles, :gross_weight, :integer
    remove_column :vehicles, :net_capacity, :string
    remove_column :vehicles, :book_value, :string
    remove_column :vehicles, :coi_date_coverage, :string
    remove_column :vehicles, :coi_num, :string
    remove_column :vehicles, :coi_amount, :string
    remove_column :vehicles, :piston_displacement, :string
    remove_column :vehicles, :category, :string
    remove_column :vehicles, :bus_series, :string
    remove_column :vehicles, :present_holder, :string
  end
end
