require "application_system_test_case"

class PaymentHistoriesTest < ApplicationSystemTestCase
  setup do
    @payment_history = payment_histories(:one)
  end

  test "visiting the index" do
    visit payment_histories_url
    assert_selector "h1", text: "Payment histories"
  end

  test "should create payment history" do
    visit payment_histories_url
    click_on "New payment history"

    fill_in "Advance payment to principal", with: @payment_history.advance_payment_to_principal
    fill_in "Ar account no", with: @payment_history.ar_account_no
    fill_in "Bank account no", with: @payment_history.bank_account_no
    fill_in "Bank name", with: @payment_history.bank_name
    fill_in "Check bank", with: @payment_history.check_bank
    fill_in "Check no", with: @payment_history.check_no
    fill_in "Current balance", with: @payment_history.current_balance
    fill_in "Deposited bank account", with: @payment_history.deposited_bank_account
    fill_in "Deposited date", with: @payment_history.deposited_date
    fill_in "Deposited memo", with: @payment_history.deposited_memo
    fill_in "Downpayment", with: @payment_history.downpayment
    fill_in "Equity", with: @payment_history.equity
    fill_in "Interest", with: @payment_history.interest
    check "Is deposited" if @payment_history.is_deposited
    fill_in "Loan", with: @payment_history.loan_id
    fill_in "Memo", with: @payment_history.memo
    fill_in "Mode of payment", with: @payment_history.mode_of_payment
    fill_in "New balance", with: @payment_history.new_balance
    fill_in "Or num", with: @payment_history.or_num
    fill_in "Others", with: @payment_history.others
    fill_in "Payment", with: @payment_history.payment
    fill_in "Payment date", with: @payment_history.payment_date
    fill_in "Penalty", with: @payment_history.penalty
    fill_in "Principal", with: @payment_history.principal
    fill_in "Processing", with: @payment_history.processing
    fill_in "Processing fee", with: @payment_history.processing_fee
    fill_in "Receipt", with: @payment_history.receipt
    fill_in "Reservation", with: @payment_history.reservation
    fill_in "Running balance", with: @payment_history.running_balance
    click_on "Create Payment history"

    assert_text "Payment history was successfully created"
    click_on "Back"
  end

  test "should update Payment history" do
    visit payment_history_url(@payment_history)
    click_on "Edit this payment history", match: :first

    fill_in "Advance payment to principal", with: @payment_history.advance_payment_to_principal
    fill_in "Ar account no", with: @payment_history.ar_account_no
    fill_in "Bank account no", with: @payment_history.bank_account_no
    fill_in "Bank name", with: @payment_history.bank_name
    fill_in "Check bank", with: @payment_history.check_bank
    fill_in "Check no", with: @payment_history.check_no
    fill_in "Current balance", with: @payment_history.current_balance
    fill_in "Deposited bank account", with: @payment_history.deposited_bank_account
    fill_in "Deposited date", with: @payment_history.deposited_date
    fill_in "Deposited memo", with: @payment_history.deposited_memo
    fill_in "Downpayment", with: @payment_history.downpayment
    fill_in "Equity", with: @payment_history.equity
    fill_in "Interest", with: @payment_history.interest
    check "Is deposited" if @payment_history.is_deposited
    fill_in "Loan", with: @payment_history.loan_id
    fill_in "Memo", with: @payment_history.memo
    fill_in "Mode of payment", with: @payment_history.mode_of_payment
    fill_in "New balance", with: @payment_history.new_balance
    fill_in "Or num", with: @payment_history.or_num
    fill_in "Others", with: @payment_history.others
    fill_in "Payment", with: @payment_history.payment
    fill_in "Payment date", with: @payment_history.payment_date
    fill_in "Penalty", with: @payment_history.penalty
    fill_in "Principal", with: @payment_history.principal
    fill_in "Processing", with: @payment_history.processing
    fill_in "Processing fee", with: @payment_history.processing_fee
    fill_in "Receipt", with: @payment_history.receipt
    fill_in "Reservation", with: @payment_history.reservation
    fill_in "Running balance", with: @payment_history.running_balance
    click_on "Update Payment history"

    assert_text "Payment history was successfully updated"
    click_on "Back"
  end

  test "should destroy Payment history" do
    visit payment_history_url(@payment_history)
    click_on "Destroy this payment history", match: :first

    assert_text "Payment history was successfully destroyed"
  end
end
