class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles, id: :uuid do |t|
      t.string :classification
      t.string :registered_owner
      t.string :bus_num
      t.string :mv_file
      t.string :plate_num
      t.string :ending_num
      t.string :body_type
      t.string :denomination
      t.string :motor_num
      t.string :chassis_num
      t.integer :gross_weight
      t.string :net_capacity
      t.string :seat_capacity
      t.string :make
      t.integer :year_model
      t.string :fuel
      t.string :num_of_cyclinder
      t.string :field_office
      t.string :cr_num
      t.date :cr_date_issue
      t.string :or_field_office
      t.string :or_num
      t.date :or_date_issue
      t.float :reg_amount
      t.string :body_color
      t.string :coc_date_coverage
      t.string :coc_num
      t.float :coc_amount
      t.string :insurance_name
      t.string :status
      t.string :book_value
      t.date :date_operate
      t.date :date_retired
      t.text :remarks
      t.string :coi_date_coverage
      t.string :quality_type
      t.string :coi_num
      t.string :coi_amount
      t.string :piston_displacement
      t.string :category
      t.string :bus_series
      t.string :present_holder
      t.string :penalties_surcharge
      t.string :cr_field_office
      t.string :type_of_vehicle
      t.string :route_per_operation
      t.integer :year_rebuild
      t.uuid :authorize_route_id
      t.uuid :franchise_id

      t.timestamps
    end
  end
end
