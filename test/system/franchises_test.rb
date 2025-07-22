require "application_system_test_case"

class FranchisesTest < ApplicationSystemTestCase
  setup do
    @franchise = franchises(:one)
  end

  test "visiting the index" do
    visit franchises_url
    assert_selector "h1", text: "Franchises"
  end

  test "should create franchise" do
    visit franchises_url
    click_on "New franchise"

    fill_in "Auth num of units", with: @franchise.auth_num_of_units
    fill_in "Authorize route", with: @franchise.authorize_route
    fill_in "Business address", with: @franchise.business_address
    fill_in "Case num", with: @franchise.case_num
    fill_in "Cpc validity", with: @franchise.cpc_validity
    fill_in "Date granted", with: @franchise.date_granted
    fill_in "Denomination", with: @franchise.denomination
    fill_in "Expiry date", with: @franchise.expiry_date
    fill_in "Num of cpc", with: @franchise.num_of_cpc
    fill_in "Operator", with: @franchise.operator
    fill_in "Remarks", with: @franchise.remarks
    fill_in "Status", with: @franchise.status
    fill_in "Year confirmed", with: @franchise.year_confirmed
    click_on "Create Franchise"

    assert_text "Franchise was successfully created"
    click_on "Back"
  end

  test "should update Franchise" do
    visit franchise_url(@franchise)
    click_on "Edit this franchise", match: :first

    fill_in "Auth num of units", with: @franchise.auth_num_of_units
    fill_in "Authorize route", with: @franchise.authorize_route
    fill_in "Business address", with: @franchise.business_address
    fill_in "Case num", with: @franchise.case_num
    fill_in "Cpc validity", with: @franchise.cpc_validity
    fill_in "Date granted", with: @franchise.date_granted
    fill_in "Denomination", with: @franchise.denomination
    fill_in "Expiry date", with: @franchise.expiry_date
    fill_in "Num of cpc", with: @franchise.num_of_cpc
    fill_in "Operator", with: @franchise.operator
    fill_in "Remarks", with: @franchise.remarks
    fill_in "Status", with: @franchise.status
    fill_in "Year confirmed", with: @franchise.year_confirmed
    click_on "Update Franchise"

    assert_text "Franchise was successfully updated"
    click_on "Back"
  end

  test "should destroy Franchise" do
    visit franchise_url(@franchise)
    click_on "Destroy this franchise", match: :first

    assert_text "Franchise was successfully destroyed"
  end
end
