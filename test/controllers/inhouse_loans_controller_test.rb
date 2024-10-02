require "test_helper"

class InhouseLoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inhouse_loan = inhouse_loans(:one)
  end

  test "should get index" do
    get inhouse_loans_url
    assert_response :success
  end

  test "should get new" do
    get new_inhouse_loan_url
    assert_response :success
  end

  test "should create inhouse_loan" do
    assert_difference("InhouseLoan.count") do
      post inhouse_loans_url, params: { inhouse_loan: { amortization_start_date: @inhouse_loan.amortization_start_date, balance: @inhouse_loan.balance, client_id: @inhouse_loan.client_id, contract_date: @inhouse_loan.contract_date, downpayment: @inhouse_loan.downpayment, interest: @inhouse_loan.interest, loan_financing: @inhouse_loan.loan_financing, loan_id: @inhouse_loan.loan_id, monthly_amort: @inhouse_loan.monthly_amort, other_expense: @inhouse_loan.other_expense, principal: @inhouse_loan.principal, processing_fees: @inhouse_loan.processing_fees, remarks: @inhouse_loan.remarks, terms: @inhouse_loan.terms } }
    end

    assert_redirected_to inhouse_loan_url(InhouseLoan.last)
  end

  test "should show inhouse_loan" do
    get inhouse_loan_url(@inhouse_loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_inhouse_loan_url(@inhouse_loan)
    assert_response :success
  end

  test "should update inhouse_loan" do
    patch inhouse_loan_url(@inhouse_loan), params: { inhouse_loan: { amortization_start_date: @inhouse_loan.amortization_start_date, balance: @inhouse_loan.balance, client_id: @inhouse_loan.client_id, contract_date: @inhouse_loan.contract_date, downpayment: @inhouse_loan.downpayment, interest: @inhouse_loan.interest, loan_financing: @inhouse_loan.loan_financing, loan_id: @inhouse_loan.loan_id, monthly_amort: @inhouse_loan.monthly_amort, other_expense: @inhouse_loan.other_expense, principal: @inhouse_loan.principal, processing_fees: @inhouse_loan.processing_fees, remarks: @inhouse_loan.remarks, terms: @inhouse_loan.terms } }
    assert_redirected_to inhouse_loan_url(@inhouse_loan)
  end

  test "should destroy inhouse_loan" do
    assert_difference("InhouseLoan.count", -1) do
      delete inhouse_loan_url(@inhouse_loan)
    end

    assert_redirected_to inhouse_loans_url
  end
end
