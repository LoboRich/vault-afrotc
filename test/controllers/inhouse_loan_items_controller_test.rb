require "test_helper"

class InhouseLoanItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inhouse_loan_item = inhouse_loan_items(:one)
  end

  test "should get index" do
    get inhouse_loan_items_url
    assert_response :success
  end

  test "should get new" do
    get new_inhouse_loan_item_url
    assert_response :success
  end

  test "should create inhouse_loan_item" do
    assert_difference("InhouseLoanItem.count") do
      post inhouse_loan_items_url, params: { inhouse_loan_item: { advance: @inhouse_loan_item.advance, balance: @inhouse_loan_item.balance, due_date: @inhouse_loan_item.due_date, inhouse_loan_id: @inhouse_loan_item.inhouse_loan_id, interest: @inhouse_loan_item.interest, is_paid: @inhouse_loan_item.is_paid, monthly_amort: @inhouse_loan_item.monthly_amort, or: @inhouse_loan_item.or, paid_amount: @inhouse_loan_item.paid_amount, payment_date: @inhouse_loan_item.payment_date, penalty: @inhouse_loan_item.penalty, principal: @inhouse_loan_item.principal, term: @inhouse_loan_item.term } }
    end

    assert_redirected_to inhouse_loan_item_url(InhouseLoanItem.last)
  end

  test "should show inhouse_loan_item" do
    get inhouse_loan_item_url(@inhouse_loan_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_inhouse_loan_item_url(@inhouse_loan_item)
    assert_response :success
  end

  test "should update inhouse_loan_item" do
    patch inhouse_loan_item_url(@inhouse_loan_item), params: { inhouse_loan_item: { advance: @inhouse_loan_item.advance, balance: @inhouse_loan_item.balance, due_date: @inhouse_loan_item.due_date, inhouse_loan_id: @inhouse_loan_item.inhouse_loan_id, interest: @inhouse_loan_item.interest, is_paid: @inhouse_loan_item.is_paid, monthly_amort: @inhouse_loan_item.monthly_amort, or: @inhouse_loan_item.or, paid_amount: @inhouse_loan_item.paid_amount, payment_date: @inhouse_loan_item.payment_date, penalty: @inhouse_loan_item.penalty, principal: @inhouse_loan_item.principal, term: @inhouse_loan_item.term } }
    assert_redirected_to inhouse_loan_item_url(@inhouse_loan_item)
  end

  test "should destroy inhouse_loan_item" do
    assert_difference("InhouseLoanItem.count", -1) do
      delete inhouse_loan_item_url(@inhouse_loan_item)
    end

    assert_redirected_to inhouse_loan_items_url
  end
end
