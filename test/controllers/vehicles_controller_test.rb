require "test_helper"

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get vehicles_url
    assert_response :success
  end

  test "should get new" do
    get new_vehicle_url
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference("Vehicle.count") do
      post vehicles_url, params: { vehicle: { authorize_route_id: @vehicle.authorize_route_id, body_color: @vehicle.body_color, body_type: @vehicle.body_type, book_value: @vehicle.book_value, bus_num: @vehicle.bus_num, bus_series: @vehicle.bus_series, category: @vehicle.category, chassis_num: @vehicle.chassis_num, classification: @vehicle.classification, coc_amount: @vehicle.coc_amount, coc_date_coverage: @vehicle.coc_date_coverage, coc_num: @vehicle.coc_num, coi_amount: @vehicle.coi_amount, coi_date_coverage: @vehicle.coi_date_coverage, coi_num: @vehicle.coi_num, cr_date_issue: @vehicle.cr_date_issue, cr_field_office: @vehicle.cr_field_office, cr_num: @vehicle.cr_num, date_operate: @vehicle.date_operate, date_retired: @vehicle.date_retired, denomination: @vehicle.denomination, ending_num: @vehicle.ending_num, field_office: @vehicle.field_office, franchise_id: @vehicle.franchise_id, fuel: @vehicle.fuel, gross_weight: @vehicle.gross_weight, insurance_name: @vehicle.insurance_name, make: @vehicle.make, motor_num: @vehicle.motor_num, mv_file: @vehicle.mv_file, net_capacity: @vehicle.net_capacity, num_of_cyclinder: @vehicle.num_of_cyclinder, or_date_issue: @vehicle.or_date_issue, or_field_office: @vehicle.or_field_office, or_num: @vehicle.or_num, penalties_surcharge: @vehicle.penalties_surcharge, piston_displacement: @vehicle.piston_displacement, plate_num: @vehicle.plate_num, present_holder: @vehicle.present_holder, quality_type: @vehicle.quality_type, reg_amount: @vehicle.reg_amount, registered_owner: @vehicle.registered_owner, remarks: @vehicle.remarks, route_per_operation: @vehicle.route_per_operation, seat_capacity: @vehicle.seat_capacity, status: @vehicle.status, type_of_vehicle: @vehicle.type_of_vehicle, year_model: @vehicle.year_model, year_rebuild: @vehicle.year_rebuild } }
    end

    assert_redirected_to vehicle_url(Vehicle.last)
  end

  test "should show vehicle" do
    get vehicle_url(@vehicle)
    assert_response :success
  end

  test "should get edit" do
    get edit_vehicle_url(@vehicle)
    assert_response :success
  end

  test "should update vehicle" do
    patch vehicle_url(@vehicle), params: { vehicle: { authorize_route_id: @vehicle.authorize_route_id, body_color: @vehicle.body_color, body_type: @vehicle.body_type, book_value: @vehicle.book_value, bus_num: @vehicle.bus_num, bus_series: @vehicle.bus_series, category: @vehicle.category, chassis_num: @vehicle.chassis_num, classification: @vehicle.classification, coc_amount: @vehicle.coc_amount, coc_date_coverage: @vehicle.coc_date_coverage, coc_num: @vehicle.coc_num, coi_amount: @vehicle.coi_amount, coi_date_coverage: @vehicle.coi_date_coverage, coi_num: @vehicle.coi_num, cr_date_issue: @vehicle.cr_date_issue, cr_field_office: @vehicle.cr_field_office, cr_num: @vehicle.cr_num, date_operate: @vehicle.date_operate, date_retired: @vehicle.date_retired, denomination: @vehicle.denomination, ending_num: @vehicle.ending_num, field_office: @vehicle.field_office, franchise_id: @vehicle.franchise_id, fuel: @vehicle.fuel, gross_weight: @vehicle.gross_weight, insurance_name: @vehicle.insurance_name, make: @vehicle.make, motor_num: @vehicle.motor_num, mv_file: @vehicle.mv_file, net_capacity: @vehicle.net_capacity, num_of_cyclinder: @vehicle.num_of_cyclinder, or_date_issue: @vehicle.or_date_issue, or_field_office: @vehicle.or_field_office, or_num: @vehicle.or_num, penalties_surcharge: @vehicle.penalties_surcharge, piston_displacement: @vehicle.piston_displacement, plate_num: @vehicle.plate_num, present_holder: @vehicle.present_holder, quality_type: @vehicle.quality_type, reg_amount: @vehicle.reg_amount, registered_owner: @vehicle.registered_owner, remarks: @vehicle.remarks, route_per_operation: @vehicle.route_per_operation, seat_capacity: @vehicle.seat_capacity, status: @vehicle.status, type_of_vehicle: @vehicle.type_of_vehicle, year_model: @vehicle.year_model, year_rebuild: @vehicle.year_rebuild } }
    assert_redirected_to vehicle_url(@vehicle)
  end

  test "should destroy vehicle" do
    assert_difference("Vehicle.count", -1) do
      delete vehicle_url(@vehicle)
    end

    assert_redirected_to vehicles_url
  end
end
