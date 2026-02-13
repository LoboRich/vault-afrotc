require "application_system_test_case"

class AnnouncemntsTest < ApplicationSystemTestCase
  setup do
    @announcemnt = announcemnts(:one)
  end

  test "visiting the index" do
    visit announcemnts_url
    assert_selector "h1", text: "Announcemnts"
  end

  test "should create announcemnt" do
    visit announcemnts_url
    click_on "New announcemnt"

    fill_in "Atype", with: @announcemnt.atype
    fill_in "Description", with: @announcemnt.description
    fill_in "Latitude", with: @announcemnt.latitude
    fill_in "Location", with: @announcemnt.location
    fill_in "Longitude", with: @announcemnt.longitude
    fill_in "Name", with: @announcemnt.name
    click_on "Create Announcemnt"

    assert_text "Announcemnt was successfully created"
    click_on "Back"
  end

  test "should update Announcemnt" do
    visit announcemnt_url(@announcemnt)
    click_on "Edit this announcemnt", match: :first

    fill_in "Atype", with: @announcemnt.atype
    fill_in "Description", with: @announcemnt.description
    fill_in "Latitude", with: @announcemnt.latitude
    fill_in "Location", with: @announcemnt.location
    fill_in "Longitude", with: @announcemnt.longitude
    fill_in "Name", with: @announcemnt.name
    click_on "Update Announcemnt"

    assert_text "Announcemnt was successfully updated"
    click_on "Back"
  end

  test "should destroy Announcemnt" do
    visit announcemnt_url(@announcemnt)
    click_on "Destroy this announcemnt", match: :first

    assert_text "Announcemnt was successfully destroyed"
  end
end
