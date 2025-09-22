require "application_system_test_case"

class PersonnelsTest < ApplicationSystemTestCase
  setup do
    @personnel = personnels(:one)
  end

  test "visiting the index" do
    visit personnels_url
    assert_selector "h1", text: "Personnels"
  end

  test "should create personnel" do
    visit personnels_url
    click_on "New personnel"

    fill_in "Branch location", with: @personnel.branch_location
    fill_in "Contact number", with: @personnel.contact_number
    fill_in "Given name", with: @personnel.given_name
    fill_in "Last name", with: @personnel.last_name
    fill_in "Role", with: @personnel.role
    fill_in "User", with: @personnel.user_id
    click_on "Create Personnel"

    assert_text "Personnel was successfully created"
    click_on "Back"
  end

  test "should update Personnel" do
    visit personnel_url(@personnel)
    click_on "Edit this personnel", match: :first

    fill_in "Branch location", with: @personnel.branch_location
    fill_in "Contact number", with: @personnel.contact_number
    fill_in "Given name", with: @personnel.given_name
    fill_in "Last name", with: @personnel.last_name
    fill_in "Role", with: @personnel.role
    fill_in "User", with: @personnel.user_id
    click_on "Update Personnel"

    assert_text "Personnel was successfully updated"
    click_on "Back"
  end

  test "should destroy Personnel" do
    visit personnel_url(@personnel)
    click_on "Destroy this personnel", match: :first

    assert_text "Personnel was successfully destroyed"
  end
end
