require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get loans_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_url
    assert_response :success
  end

  test "should create loan" do
    assert_difference("Loan.count") do
      post loans_url, params: { loan: { amortization_start_date: @loan.amortization_start_date, balance: @loan.balance, blocklot: @loan.blocklot, broker: @loan.broker, client_id: @loan.client_id, contract_date: @loan.contract_date, contract_price: @loan.contract_price, downpayment: @loan.downpayment, interest: @loan.interest, loan_financing: @loan.loan_financing, model_house: @loan.model_house, monthly_amort: @loan.monthly_amort, principal: @loan.principal, processing_fees: @loan.processing_fees, remarks: @loan.remarks, status: @loan.status, terms: @loan.terms } }
    end

    assert_redirected_to loan_url(Loan.last)
  end

  test "should show loan" do
    get loan_url(@loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test "should update loan" do
    patch loan_url(@loan), params: { loan: { amortization_start_date: @loan.amortization_start_date, balance: @loan.balance, blocklot: @loan.blocklot, broker: @loan.broker, client_id: @loan.client_id, contract_date: @loan.contract_date, contract_price: @loan.contract_price, downpayment: @loan.downpayment, interest: @loan.interest, loan_financing: @loan.loan_financing, model_house: @loan.model_house, monthly_amort: @loan.monthly_amort, principal: @loan.principal, processing_fees: @loan.processing_fees, remarks: @loan.remarks, status: @loan.status, terms: @loan.terms } }
    assert_redirected_to loan_url(@loan)
  end

  test "should destroy loan" do
    assert_difference("Loan.count", -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end
