require "test_helper"

class AuthorizeRoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authorize_route = authorize_routes(:one)
  end

  test "should get index" do
    get authorize_routes_url
    assert_response :success
  end

  test "should get new" do
    get new_authorize_route_url
    assert_response :success
  end

  test "should create authorize_route" do
    assert_difference("AuthorizeRoute.count") do
      post authorize_routes_url, params: { authorize_route: { name: @authorize_route.name, route_type: @authorize_route.route_type } }
    end

    assert_redirected_to authorize_route_url(AuthorizeRoute.last)
  end

  test "should show authorize_route" do
    get authorize_route_url(@authorize_route)
    assert_response :success
  end

  test "should get edit" do
    get edit_authorize_route_url(@authorize_route)
    assert_response :success
  end

  test "should update authorize_route" do
    patch authorize_route_url(@authorize_route), params: { authorize_route: { name: @authorize_route.name, route_type: @authorize_route.route_type } }
    assert_redirected_to authorize_route_url(@authorize_route)
  end

  test "should destroy authorize_route" do
    assert_difference("AuthorizeRoute.count", -1) do
      delete authorize_route_url(@authorize_route)
    end

    assert_redirected_to authorize_routes_url
  end
end
