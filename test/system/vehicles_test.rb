require "application_system_test_case"

class VehiclesTest < ApplicationSystemTestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "visiting the index" do
    visit vehicles_url
    assert_selector "h1", text: "Vehicles"
  end

  test "should create vehicle" do
    visit vehicles_url
    click_on "New vehicle"

    fill_in "Authorize route", with: @vehicle.authorize_route_id
    fill_in "Body color", with: @vehicle.body_color
    fill_in "Body type", with: @vehicle.body_type
    fill_in "Book value", with: @vehicle.book_value
    fill_in "Bus num", with: @vehicle.bus_num
    fill_in "Bus series", with: @vehicle.bus_series
    fill_in "Category", with: @vehicle.category
    fill_in "Chassis num", with: @vehicle.chassis_num
    fill_in "Classification", with: @vehicle.classification
    fill_in "Coc amount", with: @vehicle.coc_amount
    fill_in "Coc date coverage", with: @vehicle.coc_date_coverage
    fill_in "Coc num", with: @vehicle.coc_num
    fill_in "Coi amount", with: @vehicle.coi_amount
    fill_in "Coi date coverage", with: @vehicle.coi_date_coverage
    fill_in "Coi num", with: @vehicle.coi_num
    fill_in "Cr date issue", with: @vehicle.cr_date_issue
    fill_in "Cr field office", with: @vehicle.cr_field_office
    fill_in "Cr num", with: @vehicle.cr_num
    fill_in "Date operate", with: @vehicle.date_operate
    fill_in "Date retired", with: @vehicle.date_retired
    fill_in "Denomination", with: @vehicle.denomination
    fill_in "Ending num", with: @vehicle.ending_num
    fill_in "Field office", with: @vehicle.field_office
    fill_in "Franchise", with: @vehicle.franchise_id
    fill_in "Fuel", with: @vehicle.fuel
    fill_in "Gross weight", with: @vehicle.gross_weight
    fill_in "Insurance name", with: @vehicle.insurance_name
    fill_in "Make", with: @vehicle.make
    fill_in "Motor num", with: @vehicle.motor_num
    fill_in "Mv file", with: @vehicle.mv_file
    fill_in "Net capacity", with: @vehicle.net_capacity
    fill_in "Num of cyclinder", with: @vehicle.num_of_cyclinder
    fill_in "Or date issue", with: @vehicle.or_date_issue
    fill_in "Or field office", with: @vehicle.or_field_office
    fill_in "Or num", with: @vehicle.or_num
    fill_in "Penalties surcharge", with: @vehicle.penalties_surcharge
    fill_in "Piston displacement", with: @vehicle.piston_displacement
    fill_in "Plate num", with: @vehicle.plate_num
    fill_in "Present holder", with: @vehicle.present_holder
    fill_in "Quality type", with: @vehicle.quality_type
    fill_in "Reg amount", with: @vehicle.reg_amount
    fill_in "Registered owner", with: @vehicle.registered_owner
    fill_in "Remarks", with: @vehicle.remarks
    fill_in "Route per operation", with: @vehicle.route_per_operation
    fill_in "Seat capacity", with: @vehicle.seat_capacity
    fill_in "Status", with: @vehicle.status
    fill_in "Type of vehicle", with: @vehicle.type_of_vehicle
    fill_in "Year model", with: @vehicle.year_model
    fill_in "Year rebuild", with: @vehicle.year_rebuild
    click_on "Create Vehicle"

    assert_text "Vehicle was successfully created"
    click_on "Back"
  end

  test "should update Vehicle" do
    visit vehicle_url(@vehicle)
    click_on "Edit this vehicle", match: :first

    fill_in "Authorize route", with: @vehicle.authorize_route_id
    fill_in "Body color", with: @vehicle.body_color
    fill_in "Body type", with: @vehicle.body_type
    fill_in "Book value", with: @vehicle.book_value
    fill_in "Bus num", with: @vehicle.bus_num
    fill_in "Bus series", with: @vehicle.bus_series
    fill_in "Category", with: @vehicle.category
    fill_in "Chassis num", with: @vehicle.chassis_num
    fill_in "Classification", with: @vehicle.classification
    fill_in "Coc amount", with: @vehicle.coc_amount
    fill_in "Coc date coverage", with: @vehicle.coc_date_coverage
    fill_in "Coc num", with: @vehicle.coc_num
    fill_in "Coi amount", with: @vehicle.coi_amount
    fill_in "Coi date coverage", with: @vehicle.coi_date_coverage
    fill_in "Coi num", with: @vehicle.coi_num
    fill_in "Cr date issue", with: @vehicle.cr_date_issue
    fill_in "Cr field office", with: @vehicle.cr_field_office
    fill_in "Cr num", with: @vehicle.cr_num
    fill_in "Date operate", with: @vehicle.date_operate
    fill_in "Date retired", with: @vehicle.date_retired
    fill_in "Denomination", with: @vehicle.denomination
    fill_in "Ending num", with: @vehicle.ending_num
    fill_in "Field office", with: @vehicle.field_office
    fill_in "Franchise", with: @vehicle.franchise_id
    fill_in "Fuel", with: @vehicle.fuel
    fill_in "Gross weight", with: @vehicle.gross_weight
    fill_in "Insurance name", with: @vehicle.insurance_name
    fill_in "Make", with: @vehicle.make
    fill_in "Motor num", with: @vehicle.motor_num
    fill_in "Mv file", with: @vehicle.mv_file
    fill_in "Net capacity", with: @vehicle.net_capacity
    fill_in "Num of cyclinder", with: @vehicle.num_of_cyclinder
    fill_in "Or date issue", with: @vehicle.or_date_issue
    fill_in "Or field office", with: @vehicle.or_field_office
    fill_in "Or num", with: @vehicle.or_num
    fill_in "Penalties surcharge", with: @vehicle.penalties_surcharge
    fill_in "Piston displacement", with: @vehicle.piston_displacement
    fill_in "Plate num", with: @vehicle.plate_num
    fill_in "Present holder", with: @vehicle.present_holder
    fill_in "Quality type", with: @vehicle.quality_type
    fill_in "Reg amount", with: @vehicle.reg_amount
    fill_in "Registered owner", with: @vehicle.registered_owner
    fill_in "Remarks", with: @vehicle.remarks
    fill_in "Route per operation", with: @vehicle.route_per_operation
    fill_in "Seat capacity", with: @vehicle.seat_capacity
    fill_in "Status", with: @vehicle.status
    fill_in "Type of vehicle", with: @vehicle.type_of_vehicle
    fill_in "Year model", with: @vehicle.year_model
    fill_in "Year rebuild", with: @vehicle.year_rebuild
    click_on "Update Vehicle"

    assert_text "Vehicle was successfully updated"
    click_on "Back"
  end

  test "should destroy Vehicle" do
    visit vehicle_url(@vehicle)
    click_on "Destroy this vehicle", match: :first

    assert_text "Vehicle was successfully destroyed"
  end
end
