require "application_system_test_case"

class InhouseLoansTest < ApplicationSystemTestCase
  setup do
    @inhouse_loan = inhouse_loans(:one)
  end

  test "visiting the index" do
    visit inhouse_loans_url
    assert_selector "h1", text: "Inhouse loans"
  end

  test "should create inhouse loan" do
    visit inhouse_loans_url
    click_on "New inhouse loan"

    fill_in "Amortization start date", with: @inhouse_loan.amortization_start_date
    fill_in "Balance", with: @inhouse_loan.balance
    fill_in "Client", with: @inhouse_loan.client_id
    fill_in "Contract date", with: @inhouse_loan.contract_date
    fill_in "Downpayment", with: @inhouse_loan.downpayment
    fill_in "Interest", with: @inhouse_loan.interest
    fill_in "Loan financing", with: @inhouse_loan.loan_financing
    fill_in "Loan", with: @inhouse_loan.loan_id
    fill_in "Monthly amort", with: @inhouse_loan.monthly_amort
    fill_in "Other expense", with: @inhouse_loan.other_expense
    fill_in "Principal", with: @inhouse_loan.principal
    fill_in "Processing fees", with: @inhouse_loan.processing_fees
    fill_in "Remarks", with: @inhouse_loan.remarks
    fill_in "Terms", with: @inhouse_loan.terms
    click_on "Create Inhouse loan"

    assert_text "Inhouse loan was successfully created"
    click_on "Back"
  end

  test "should update Inhouse loan" do
    visit inhouse_loan_url(@inhouse_loan)
    click_on "Edit this inhouse loan", match: :first

    fill_in "Amortization start date", with: @inhouse_loan.amortization_start_date
    fill_in "Balance", with: @inhouse_loan.balance
    fill_in "Client", with: @inhouse_loan.client_id
    fill_in "Contract date", with: @inhouse_loan.contract_date
    fill_in "Downpayment", with: @inhouse_loan.downpayment
    fill_in "Interest", with: @inhouse_loan.interest
    fill_in "Loan financing", with: @inhouse_loan.loan_financing
    fill_in "Loan", with: @inhouse_loan.loan_id
    fill_in "Monthly amort", with: @inhouse_loan.monthly_amort
    fill_in "Other expense", with: @inhouse_loan.other_expense
    fill_in "Principal", with: @inhouse_loan.principal
    fill_in "Processing fees", with: @inhouse_loan.processing_fees
    fill_in "Remarks", with: @inhouse_loan.remarks
    fill_in "Terms", with: @inhouse_loan.terms
    click_on "Update Inhouse loan"

    assert_text "Inhouse loan was successfully updated"
    click_on "Back"
  end

  test "should destroy Inhouse loan" do
    visit inhouse_loan_url(@inhouse_loan)
    click_on "Destroy this inhouse loan", match: :first

    assert_text "Inhouse loan was successfully destroyed"
  end
end
