require "test_helper"

class AdtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adt = adts(:one)
  end

  test "should get index" do
    get adts_url
    assert_response :success
  end

  test "should get new" do
    get new_adt_url
    assert_response :success
  end

  test "should create adt" do
    assert_difference("Adt.count") do
      post adts_url, params: { adt: { date_of_enlistment: @adt.date_of_enlistment, designation: @adt.designation, reservist_id: @adt.reservist_id, special_order_no: @adt.special_order_no, special_order_no_date: @adt.special_order_no_date, squadron: @adt.squadron, subject: @adt.subject } }
    end

    assert_redirected_to adt_url(Adt.last)
  end

  test "should show adt" do
    get adt_url(@adt)
    assert_response :success
  end

  test "should get edit" do
    get edit_adt_url(@adt)
    assert_response :success
  end

  test "should update adt" do
    patch adt_url(@adt), params: { adt: { date_of_enlistment: @adt.date_of_enlistment, designation: @adt.designation, reservist_id: @adt.reservist_id, special_order_no: @adt.special_order_no, special_order_no_date: @adt.special_order_no_date, squadron: @adt.squadron, subject: @adt.subject } }
    assert_redirected_to adt_url(@adt)
  end

  test "should destroy adt" do
    assert_difference("Adt.count", -1) do
      delete adt_url(@adt)
    end

    assert_redirected_to adts_url
  end
end
