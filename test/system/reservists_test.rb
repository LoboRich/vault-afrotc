require "application_system_test_case"

class ReservistsTest < ApplicationSystemTestCase
  setup do
    @reservist = reservists(:one)
  end

  test "visiting the index" do
    visit reservists_url
    assert_selector "h1", text: "Reservists"
  end

  test "should create reservist" do
    visit reservists_url
    click_on "New reservist"

    fill_in "Afpsn", with: @reservist.afpsn
    fill_in "Age", with: @reservist.age
    fill_in "Blood type", with: @reservist.blood_type
    fill_in "Branch of service", with: @reservist.branch_of_service
    fill_in "City", with: @reservist.city
    fill_in "Classification authority", with: @reservist.classification_authority
    fill_in "Complexion", with: @reservist.complexion
    fill_in "Date assigned", with: @reservist.date_assigned
    fill_in "Date of birth", with: @reservist.date_of_birth
    fill_in "Date of classification", with: @reservist.date_of_classification
    fill_in "Dialects spoken", with: @reservist.dialects_spoken
    fill_in "Duty afsc", with: @reservist.duty_afsc
    fill_in "Email", with: @reservist.email
    fill_in "Ethnic group", with: @reservist.ethnic_group
    fill_in "Eye color", with: @reservist.eye_color
    fill_in "First name", with: @reservist.first_name
    fill_in "Gsis number", with: @reservist.gsis_number
    fill_in "Hair color", with: @reservist.hair_color
    fill_in "Height cm", with: @reservist.height_cm
    fill_in "Identifying marks", with: @reservist.identifying_marks
    fill_in "Last name", with: @reservist.last_name
    fill_in "Lat", with: @reservist.lat
    fill_in "Latitude", with: @reservist.latitude
    fill_in "Long", with: @reservist.long
    fill_in "Longitude", with: @reservist.longitude
    fill_in "Marital status", with: @reservist.marital_status
    fill_in "Middle name", with: @reservist.middle_name
    fill_in "Mobile nr", with: @reservist.mobile_nr
    fill_in "Mobilization center", with: @reservist.mobilization_center
    fill_in "Office tel", with: @reservist.office_tel
    fill_in "Other skills", with: @reservist.other_skills
    fill_in "Pagibig number", with: @reservist.pagibig_number
    fill_in "Philhealth number", with: @reservist.philhealth_number
    fill_in "Place of birth", with: @reservist.place_of_birth
    fill_in "Present designation", with: @reservist.present_designation
    fill_in "Primary afsc", with: @reservist.primary_afsc
    fill_in "Province", with: @reservist.province
    fill_in "Rank", with: @reservist.rank
    fill_in "Region", with: @reservist.region
    fill_in "Religion", with: @reservist.religion
    fill_in "Reserve unit assignment", with: @reservist.reserve_unit_assignment
    fill_in "Reservist classification", with: @reservist.reservist_classification
    fill_in "Residence tel", with: @reservist.residence_tel
    fill_in "Sex", with: @reservist.sex
    fill_in "Soc authority", with: @reservist.soc_authority
    fill_in "Soc date of enlistment", with: @reservist.soc_date_of_enlistment
    fill_in "Soc initial rank", with: @reservist.soc_initial_rank
    fill_in "Soe authority", with: @reservist.soe_authority
    fill_in "Soe date of enlistment", with: @reservist.soe_date_of_enlistment
    fill_in "Soe initial rank", with: @reservist.soe_initial_rank
    fill_in "Source of commission", with: @reservist.source_of_commission
    fill_in "Source of enlistment", with: @reservist.source_of_enlistment
    fill_in "Sss number", with: @reservist.sss_number
    fill_in "Street address", with: @reservist.street_address
    fill_in "Tin", with: @reservist.tin
    fill_in "Unit capability", with: @reservist.unit_capability
    fill_in "Weight kg", with: @reservist.weight_kg
    fill_in "Zip code", with: @reservist.zip_code
    click_on "Create Reservist"

    assert_text "Reservist was successfully created"
    click_on "Back"
  end

  test "should update Reservist" do
    visit reservist_url(@reservist)
    click_on "Edit this reservist", match: :first

    fill_in "Afpsn", with: @reservist.afpsn
    fill_in "Age", with: @reservist.age
    fill_in "Blood type", with: @reservist.blood_type
    fill_in "Branch of service", with: @reservist.branch_of_service
    fill_in "City", with: @reservist.city
    fill_in "Classification authority", with: @reservist.classification_authority
    fill_in "Complexion", with: @reservist.complexion
    fill_in "Date assigned", with: @reservist.date_assigned
    fill_in "Date of birth", with: @reservist.date_of_birth
    fill_in "Date of classification", with: @reservist.date_of_classification
    fill_in "Dialects spoken", with: @reservist.dialects_spoken
    fill_in "Duty afsc", with: @reservist.duty_afsc
    fill_in "Email", with: @reservist.email
    fill_in "Ethnic group", with: @reservist.ethnic_group
    fill_in "Eye color", with: @reservist.eye_color
    fill_in "First name", with: @reservist.first_name
    fill_in "Gsis number", with: @reservist.gsis_number
    fill_in "Hair color", with: @reservist.hair_color
    fill_in "Height cm", with: @reservist.height_cm
    fill_in "Identifying marks", with: @reservist.identifying_marks
    fill_in "Last name", with: @reservist.last_name
    fill_in "Lat", with: @reservist.lat
    fill_in "Latitude", with: @reservist.latitude
    fill_in "Long", with: @reservist.long
    fill_in "Longitude", with: @reservist.longitude
    fill_in "Marital status", with: @reservist.marital_status
    fill_in "Middle name", with: @reservist.middle_name
    fill_in "Mobile nr", with: @reservist.mobile_nr
    fill_in "Mobilization center", with: @reservist.mobilization_center
    fill_in "Office tel", with: @reservist.office_tel
    fill_in "Other skills", with: @reservist.other_skills
    fill_in "Pagibig number", with: @reservist.pagibig_number
    fill_in "Philhealth number", with: @reservist.philhealth_number
    fill_in "Place of birth", with: @reservist.place_of_birth
    fill_in "Present designation", with: @reservist.present_designation
    fill_in "Primary afsc", with: @reservist.primary_afsc
    fill_in "Province", with: @reservist.province
    fill_in "Rank", with: @reservist.rank
    fill_in "Region", with: @reservist.region
    fill_in "Religion", with: @reservist.religion
    fill_in "Reserve unit assignment", with: @reservist.reserve_unit_assignment
    fill_in "Reservist classification", with: @reservist.reservist_classification
    fill_in "Residence tel", with: @reservist.residence_tel
    fill_in "Sex", with: @reservist.sex
    fill_in "Soc authority", with: @reservist.soc_authority
    fill_in "Soc date of enlistment", with: @reservist.soc_date_of_enlistment
    fill_in "Soc initial rank", with: @reservist.soc_initial_rank
    fill_in "Soe authority", with: @reservist.soe_authority
    fill_in "Soe date of enlistment", with: @reservist.soe_date_of_enlistment
    fill_in "Soe initial rank", with: @reservist.soe_initial_rank
    fill_in "Source of commission", with: @reservist.source_of_commission
    fill_in "Source of enlistment", with: @reservist.source_of_enlistment
    fill_in "Sss number", with: @reservist.sss_number
    fill_in "Street address", with: @reservist.street_address
    fill_in "Tin", with: @reservist.tin
    fill_in "Unit capability", with: @reservist.unit_capability
    fill_in "Weight kg", with: @reservist.weight_kg
    fill_in "Zip code", with: @reservist.zip_code
    click_on "Update Reservist"

    assert_text "Reservist was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservist" do
    visit reservist_url(@reservist)
    click_on "Destroy this reservist", match: :first

    assert_text "Reservist was successfully destroyed"
  end
end
