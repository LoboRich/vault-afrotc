require "test_helper"

class PaymentHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_history = payment_histories(:one)
  end

  test "should get index" do
    get payment_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_history_url
    assert_response :success
  end

  test "should create payment_history" do
    assert_difference("PaymentHistory.count") do
      post payment_histories_url, params: { payment_history: { advance_payment_to_principal: @payment_history.advance_payment_to_principal, ar_account_no: @payment_history.ar_account_no, bank_account_no: @payment_history.bank_account_no, bank_name: @payment_history.bank_name, check_bank: @payment_history.check_bank, check_no: @payment_history.check_no, current_balance: @payment_history.current_balance, deposited_bank_account: @payment_history.deposited_bank_account, deposited_date: @payment_history.deposited_date, deposited_memo: @payment_history.deposited_memo, downpayment: @payment_history.downpayment, equity: @payment_history.equity, interest: @payment_history.interest, is_deposited: @payment_history.is_deposited, loan_id: @payment_history.loan_id, memo: @payment_history.memo, mode_of_payment: @payment_history.mode_of_payment, new_balance: @payment_history.new_balance, or_num: @payment_history.or_num, others: @payment_history.others, payment: @payment_history.payment, payment_date: @payment_history.payment_date, penalty: @payment_history.penalty, principal: @payment_history.principal, processing: @payment_history.processing, processing_fee: @payment_history.processing_fee, receipt: @payment_history.receipt, reservation: @payment_history.reservation, running_balance: @payment_history.running_balance } }
    end

    assert_redirected_to payment_history_url(PaymentHistory.last)
  end

  test "should show payment_history" do
    get payment_history_url(@payment_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_history_url(@payment_history)
    assert_response :success
  end

  test "should update payment_history" do
    patch payment_history_url(@payment_history), params: { payment_history: { advance_payment_to_principal: @payment_history.advance_payment_to_principal, ar_account_no: @payment_history.ar_account_no, bank_account_no: @payment_history.bank_account_no, bank_name: @payment_history.bank_name, check_bank: @payment_history.check_bank, check_no: @payment_history.check_no, current_balance: @payment_history.current_balance, deposited_bank_account: @payment_history.deposited_bank_account, deposited_date: @payment_history.deposited_date, deposited_memo: @payment_history.deposited_memo, downpayment: @payment_history.downpayment, equity: @payment_history.equity, interest: @payment_history.interest, is_deposited: @payment_history.is_deposited, loan_id: @payment_history.loan_id, memo: @payment_history.memo, mode_of_payment: @payment_history.mode_of_payment, new_balance: @payment_history.new_balance, or_num: @payment_history.or_num, others: @payment_history.others, payment: @payment_history.payment, payment_date: @payment_history.payment_date, penalty: @payment_history.penalty, principal: @payment_history.principal, processing: @payment_history.processing, processing_fee: @payment_history.processing_fee, receipt: @payment_history.receipt, reservation: @payment_history.reservation, running_balance: @payment_history.running_balance } }
    assert_redirected_to payment_history_url(@payment_history)
  end

  test "should destroy payment_history" do
    assert_difference("PaymentHistory.count", -1) do
      delete payment_history_url(@payment_history)
    end

    assert_redirected_to payment_histories_url
  end
end
