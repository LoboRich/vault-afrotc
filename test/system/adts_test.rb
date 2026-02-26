require "application_system_test_case"

class AdtsTest < ApplicationSystemTestCase
  setup do
    @adt = adts(:one)
  end

  test "visiting the index" do
    visit adts_url
    assert_selector "h1", text: "Adts"
  end

  test "should create adt" do
    visit adts_url
    click_on "New adt"

    fill_in "Date of enlistment", with: @adt.date_of_enlistment
    fill_in "Designation", with: @adt.designation
    fill_in "Reservist", with: @adt.reservist_id
    fill_in "Special order no", with: @adt.special_order_no
    fill_in "Special order no date", with: @adt.special_order_no_date
    fill_in "Squadron", with: @adt.squadron
    fill_in "Subject", with: @adt.subject
    click_on "Create Adt"

    assert_text "Adt was successfully created"
    click_on "Back"
  end

  test "should update Adt" do
    visit adt_url(@adt)
    click_on "Edit this adt", match: :first

    fill_in "Date of enlistment", with: @adt.date_of_enlistment
    fill_in "Designation", with: @adt.designation
    fill_in "Reservist", with: @adt.reservist_id
    fill_in "Special order no", with: @adt.special_order_no
    fill_in "Special order no date", with: @adt.special_order_no_date
    fill_in "Squadron", with: @adt.squadron
    fill_in "Subject", with: @adt.subject
    click_on "Update Adt"

    assert_text "Adt was successfully updated"
    click_on "Back"
  end

  test "should destroy Adt" do
    visit adt_url(@adt)
    click_on "Destroy this adt", match: :first

    assert_text "Adt was successfully destroyed"
  end
end
