require "test_helper"

class ReservistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservist = reservists(:one)
  end

  test "should get index" do
    get reservists_url
    assert_response :success
  end

  test "should get new" do
    get new_reservist_url
    assert_response :success
  end

  test "should create reservist" do
    assert_difference("Reservist.count") do
      post reservists_url, params: { reservist: { afpsn: @reservist.afpsn, age: @reservist.age, blood_type: @reservist.blood_type, branch_of_service: @reservist.branch_of_service, city: @reservist.city, classification_authority: @reservist.classification_authority, complexion: @reservist.complexion, date_assigned: @reservist.date_assigned, date_of_birth: @reservist.date_of_birth, date_of_classification: @reservist.date_of_classification, dialects_spoken: @reservist.dialects_spoken, duty_afsc: @reservist.duty_afsc, email: @reservist.email, ethnic_group: @reservist.ethnic_group, eye_color: @reservist.eye_color, first_name: @reservist.first_name, gsis_number: @reservist.gsis_number, hair_color: @reservist.hair_color, height_cm: @reservist.height_cm, identifying_marks: @reservist.identifying_marks, last_name: @reservist.last_name, lat: @reservist.lat, latitude: @reservist.latitude, long: @reservist.long, longitude: @reservist.longitude, marital_status: @reservist.marital_status, middle_name: @reservist.middle_name, mobile_nr: @reservist.mobile_nr, mobilization_center: @reservist.mobilization_center, office_tel: @reservist.office_tel, other_skills: @reservist.other_skills, pagibig_number: @reservist.pagibig_number, philhealth_number: @reservist.philhealth_number, place_of_birth: @reservist.place_of_birth, present_designation: @reservist.present_designation, primary_afsc: @reservist.primary_afsc, province: @reservist.province, rank: @reservist.rank, region: @reservist.region, religion: @reservist.religion, reserve_unit_assignment: @reservist.reserve_unit_assignment, reservist_classification: @reservist.reservist_classification, residence_tel: @reservist.residence_tel, sex: @reservist.sex, soc_authority: @reservist.soc_authority, soc_date_of_enlistment: @reservist.soc_date_of_enlistment, soc_initial_rank: @reservist.soc_initial_rank, soe_authority: @reservist.soe_authority, soe_date_of_enlistment: @reservist.soe_date_of_enlistment, soe_initial_rank: @reservist.soe_initial_rank, source_of_commission: @reservist.source_of_commission, source_of_enlistment: @reservist.source_of_enlistment, sss_number: @reservist.sss_number, street_address: @reservist.street_address, tin: @reservist.tin, unit_capability: @reservist.unit_capability, weight_kg: @reservist.weight_kg, zip_code: @reservist.zip_code } }
    end

    assert_redirected_to reservist_url(Reservist.last)
  end

  test "should show reservist" do
    get reservist_url(@reservist)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservist_url(@reservist)
    assert_response :success
  end

  test "should update reservist" do
    patch reservist_url(@reservist), params: { reservist: { afpsn: @reservist.afpsn, age: @reservist.age, blood_type: @reservist.blood_type, branch_of_service: @reservist.branch_of_service, city: @reservist.city, classification_authority: @reservist.classification_authority, complexion: @reservist.complexion, date_assigned: @reservist.date_assigned, date_of_birth: @reservist.date_of_birth, date_of_classification: @reservist.date_of_classification, dialects_spoken: @reservist.dialects_spoken, duty_afsc: @reservist.duty_afsc, email: @reservist.email, ethnic_group: @reservist.ethnic_group, eye_color: @reservist.eye_color, first_name: @reservist.first_name, gsis_number: @reservist.gsis_number, hair_color: @reservist.hair_color, height_cm: @reservist.height_cm, identifying_marks: @reservist.identifying_marks, last_name: @reservist.last_name, lat: @reservist.lat, latitude: @reservist.latitude, long: @reservist.long, longitude: @reservist.longitude, marital_status: @reservist.marital_status, middle_name: @reservist.middle_name, mobile_nr: @reservist.mobile_nr, mobilization_center: @reservist.mobilization_center, office_tel: @reservist.office_tel, other_skills: @reservist.other_skills, pagibig_number: @reservist.pagibig_number, philhealth_number: @reservist.philhealth_number, place_of_birth: @reservist.place_of_birth, present_designation: @reservist.present_designation, primary_afsc: @reservist.primary_afsc, province: @reservist.province, rank: @reservist.rank, region: @reservist.region, religion: @reservist.religion, reserve_unit_assignment: @reservist.reserve_unit_assignment, reservist_classification: @reservist.reservist_classification, residence_tel: @reservist.residence_tel, sex: @reservist.sex, soc_authority: @reservist.soc_authority, soc_date_of_enlistment: @reservist.soc_date_of_enlistment, soc_initial_rank: @reservist.soc_initial_rank, soe_authority: @reservist.soe_authority, soe_date_of_enlistment: @reservist.soe_date_of_enlistment, soe_initial_rank: @reservist.soe_initial_rank, source_of_commission: @reservist.source_of_commission, source_of_enlistment: @reservist.source_of_enlistment, sss_number: @reservist.sss_number, street_address: @reservist.street_address, tin: @reservist.tin, unit_capability: @reservist.unit_capability, weight_kg: @reservist.weight_kg, zip_code: @reservist.zip_code } }
    assert_redirected_to reservist_url(@reservist)
  end

  test "should destroy reservist" do
    assert_difference("Reservist.count", -1) do
      delete reservist_url(@reservist)
    end

    assert_redirected_to reservists_url
  end
end
