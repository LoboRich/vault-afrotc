require "application_system_test_case"

class AuthorizeRoutesTest < ApplicationSystemTestCase
  setup do
    @authorize_route = authorize_routes(:one)
  end

  test "visiting the index" do
    visit authorize_routes_url
    assert_selector "h1", text: "Authorize routes"
  end

  test "should create authorize route" do
    visit authorize_routes_url
    click_on "New authorize route"

    fill_in "Name", with: @authorize_route.name
    fill_in "Route type", with: @authorize_route.route_type
    click_on "Create Authorize route"

    assert_text "Authorize route was successfully created"
    click_on "Back"
  end

  test "should update Authorize route" do
    visit authorize_route_url(@authorize_route)
    click_on "Edit this authorize route", match: :first

    fill_in "Name", with: @authorize_route.name
    fill_in "Route type", with: @authorize_route.route_type
    click_on "Update Authorize route"

    assert_text "Authorize route was successfully updated"
    click_on "Back"
  end

  test "should destroy Authorize route" do
    visit authorize_route_url(@authorize_route)
    click_on "Destroy this authorize route", match: :first

    assert_text "Authorize route was successfully destroyed"
  end
end
