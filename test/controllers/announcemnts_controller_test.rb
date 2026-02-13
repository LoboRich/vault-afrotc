require "test_helper"

class AnnouncemntsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announcemnt = announcemnts(:one)
  end

  test "should get index" do
    get announcemnts_url
    assert_response :success
  end

  test "should get new" do
    get new_announcemnt_url
    assert_response :success
  end

  test "should create announcemnt" do
    assert_difference("Announcemnt.count") do
      post announcemnts_url, params: { announcemnt: { atype: @announcemnt.atype, description: @announcemnt.description, latitude: @announcemnt.latitude, location: @announcemnt.location, longitude: @announcemnt.longitude, name: @announcemnt.name } }
    end

    assert_redirected_to announcemnt_url(Announcemnt.last)
  end

  test "should show announcemnt" do
    get announcemnt_url(@announcemnt)
    assert_response :success
  end

  test "should get edit" do
    get edit_announcemnt_url(@announcemnt)
    assert_response :success
  end

  test "should update announcemnt" do
    patch announcemnt_url(@announcemnt), params: { announcemnt: { atype: @announcemnt.atype, description: @announcemnt.description, latitude: @announcemnt.latitude, location: @announcemnt.location, longitude: @announcemnt.longitude, name: @announcemnt.name } }
    assert_redirected_to announcemnt_url(@announcemnt)
  end

  test "should destroy announcemnt" do
    assert_difference("Announcemnt.count", -1) do
      delete announcemnt_url(@announcemnt)
    end

    assert_redirected_to announcemnts_url
  end
end
