require "application_system_test_case"

class LoansTest < ApplicationSystemTestCase
  setup do
    @loan = loans(:one)
  end

  test "visiting the index" do
    visit loans_url
    assert_selector "h1", text: "Loans"
  end

  test "should create loan" do
    visit loans_url
    click_on "New loan"

    fill_in "Amortization start date", with: @loan.amortization_start_date
    fill_in "Balance", with: @loan.balance
    fill_in "Blocklot", with: @loan.blocklot
    fill_in "Broker", with: @loan.broker
    fill_in "Client", with: @loan.client_id
    fill_in "Contract date", with: @loan.contract_date
    fill_in "Contract price", with: @loan.contract_price
    fill_in "Downpayment", with: @loan.downpayment
    fill_in "Interest", with: @loan.interest
    fill_in "Loan financing", with: @loan.loan_financing
    fill_in "Model house", with: @loan.model_house
    fill_in "Monthly amort", with: @loan.monthly_amort
    fill_in "Principal", with: @loan.principal
    fill_in "Processing fees", with: @loan.processing_fees
    fill_in "Remarks", with: @loan.remarks
    fill_in "Status", with: @loan.status
    fill_in "Terms", with: @loan.terms
    click_on "Create Loan"

    assert_text "Loan was successfully created"
    click_on "Back"
  end

  test "should update Loan" do
    visit loan_url(@loan)
    click_on "Edit this loan", match: :first

    fill_in "Amortization start date", with: @loan.amortization_start_date
    fill_in "Balance", with: @loan.balance
    fill_in "Blocklot", with: @loan.blocklot
    fill_in "Broker", with: @loan.broker
    fill_in "Client", with: @loan.client_id
    fill_in "Contract date", with: @loan.contract_date
    fill_in "Contract price", with: @loan.contract_price
    fill_in "Downpayment", with: @loan.downpayment
    fill_in "Interest", with: @loan.interest
    fill_in "Loan financing", with: @loan.loan_financing
    fill_in "Model house", with: @loan.model_house
    fill_in "Monthly amort", with: @loan.monthly_amort
    fill_in "Principal", with: @loan.principal
    fill_in "Processing fees", with: @loan.processing_fees
    fill_in "Remarks", with: @loan.remarks
    fill_in "Status", with: @loan.status
    fill_in "Terms", with: @loan.terms
    click_on "Update Loan"

    assert_text "Loan was successfully updated"
    click_on "Back"
  end

  test "should destroy Loan" do
    visit loan_url(@loan)
    click_on "Destroy this loan", match: :first

    assert_text "Loan was successfully destroyed"
  end
end
