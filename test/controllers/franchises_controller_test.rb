require "test_helper"

class FranchisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franchise = franchises(:one)
  end

  test "should get index" do
    get franchises_url
    assert_response :success
  end

  test "should get new" do
    get new_franchise_url
    assert_response :success
  end

  test "should create franchise" do
    assert_difference("Franchise.count") do
      post franchises_url, params: { franchise: { auth_num_of_units: @franchise.auth_num_of_units, authorize_route: @franchise.authorize_route, business_address: @franchise.business_address, case_num: @franchise.case_num, cpc_validity: @franchise.cpc_validity, date_granted: @franchise.date_granted, denomination: @franchise.denomination, expiry_date: @franchise.expiry_date, num_of_cpc: @franchise.num_of_cpc, operator: @franchise.operator, remarks: @franchise.remarks, status: @franchise.status, year_confirmed: @franchise.year_confirmed } }
    end

    assert_redirected_to franchise_url(Franchise.last)
  end

  test "should show franchise" do
    get franchise_url(@franchise)
    assert_response :success
  end

  test "should get edit" do
    get edit_franchise_url(@franchise)
    assert_response :success
  end

  test "should update franchise" do
    patch franchise_url(@franchise), params: { franchise: { auth_num_of_units: @franchise.auth_num_of_units, authorize_route: @franchise.authorize_route, business_address: @franchise.business_address, case_num: @franchise.case_num, cpc_validity: @franchise.cpc_validity, date_granted: @franchise.date_granted, denomination: @franchise.denomination, expiry_date: @franchise.expiry_date, num_of_cpc: @franchise.num_of_cpc, operator: @franchise.operator, remarks: @franchise.remarks, status: @franchise.status, year_confirmed: @franchise.year_confirmed } }
    assert_redirected_to franchise_url(@franchise)
  end

  test "should destroy franchise" do
    assert_difference("Franchise.count", -1) do
      delete franchise_url(@franchise)
    end

    assert_redirected_to franchises_url
  end
end
