require "application_system_test_case"

class WaterBillsTest < ApplicationSystemTestCase
  setup do
    @water_bill = water_bills(:one)
  end

  test "visiting the index" do
    visit water_bills_url
    assert_selector "h1", text: "Water bills"
  end

  test "should create water bill" do
    visit water_bills_url
    click_on "New water bill"

    fill_in "Amount", with: @water_bill.amount
    fill_in "Client", with: @water_bill.client_id
    fill_in "Consume", with: @water_bill.consume
    fill_in "Current", with: @water_bill.current
    fill_in "Due date", with: @water_bill.due_date
    fill_in "Grace period", with: @water_bill.grace_period
    fill_in "Loan", with: @water_bill.loan_id
    fill_in "Mode of payment", with: @water_bill.mode_of_payment
    fill_in "Or number", with: @water_bill.or_number
    fill_in "Penalty", with: @water_bill.penalty
    fill_in "Previous", with: @water_bill.previous
    fill_in "Reading date", with: @water_bill.reading_date
    fill_in "Receipt", with: @water_bill.receipt
    fill_in "Reference number", with: @water_bill.reference_number
    fill_in "Remarks", with: @water_bill.remarks
    fill_in "Status", with: @water_bill.status
    fill_in "Total", with: @water_bill.total
    click_on "Create Water bill"

    assert_text "Water bill was successfully created"
    click_on "Back"
  end

  test "should update Water bill" do
    visit water_bill_url(@water_bill)
    click_on "Edit this water bill", match: :first

    fill_in "Amount", with: @water_bill.amount
    fill_in "Client", with: @water_bill.client_id
    fill_in "Consume", with: @water_bill.consume
    fill_in "Current", with: @water_bill.current
    fill_in "Due date", with: @water_bill.due_date
    fill_in "Grace period", with: @water_bill.grace_period
    fill_in "Loan", with: @water_bill.loan_id
    fill_in "Mode of payment", with: @water_bill.mode_of_payment
    fill_in "Or number", with: @water_bill.or_number
    fill_in "Penalty", with: @water_bill.penalty
    fill_in "Previous", with: @water_bill.previous
    fill_in "Reading date", with: @water_bill.reading_date
    fill_in "Receipt", with: @water_bill.receipt
    fill_in "Reference number", with: @water_bill.reference_number
    fill_in "Remarks", with: @water_bill.remarks
    fill_in "Status", with: @water_bill.status
    fill_in "Total", with: @water_bill.total
    click_on "Update Water bill"

    assert_text "Water bill was successfully updated"
    click_on "Back"
  end

  test "should destroy Water bill" do
    visit water_bill_url(@water_bill)
    click_on "Destroy this water bill", match: :first

    assert_text "Water bill was successfully destroyed"
  end
end
