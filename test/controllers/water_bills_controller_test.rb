require "test_helper"

class WaterBillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @water_bill = water_bills(:one)
  end

  test "should get index" do
    get water_bills_url
    assert_response :success
  end

  test "should get new" do
    get new_water_bill_url
    assert_response :success
  end

  test "should create water_bill" do
    assert_difference("WaterBill.count") do
      post water_bills_url, params: { water_bill: { amount: @water_bill.amount, client_id: @water_bill.client_id, consume: @water_bill.consume, current: @water_bill.current, due_date: @water_bill.due_date, grace_period: @water_bill.grace_period, loan_id: @water_bill.loan_id, mode_of_payment: @water_bill.mode_of_payment, or_number: @water_bill.or_number, penalty: @water_bill.penalty, previous: @water_bill.previous, reading_date: @water_bill.reading_date, receipt: @water_bill.receipt, reference_number: @water_bill.reference_number, remarks: @water_bill.remarks, status: @water_bill.status, total: @water_bill.total } }
    end

    assert_redirected_to water_bill_url(WaterBill.last)
  end

  test "should show water_bill" do
    get water_bill_url(@water_bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_water_bill_url(@water_bill)
    assert_response :success
  end

  test "should update water_bill" do
    patch water_bill_url(@water_bill), params: { water_bill: { amount: @water_bill.amount, client_id: @water_bill.client_id, consume: @water_bill.consume, current: @water_bill.current, due_date: @water_bill.due_date, grace_period: @water_bill.grace_period, loan_id: @water_bill.loan_id, mode_of_payment: @water_bill.mode_of_payment, or_number: @water_bill.or_number, penalty: @water_bill.penalty, previous: @water_bill.previous, reading_date: @water_bill.reading_date, receipt: @water_bill.receipt, reference_number: @water_bill.reference_number, remarks: @water_bill.remarks, status: @water_bill.status, total: @water_bill.total } }
    assert_redirected_to water_bill_url(@water_bill)
  end

  test "should destroy water_bill" do
    assert_difference("WaterBill.count", -1) do
      delete water_bill_url(@water_bill)
    end

    assert_redirected_to water_bills_url
  end
end
