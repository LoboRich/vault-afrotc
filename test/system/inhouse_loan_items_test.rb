require "application_system_test_case"

class InhouseLoanItemsTest < ApplicationSystemTestCase
  setup do
    @inhouse_loan_item = inhouse_loan_items(:one)
  end

  test "visiting the index" do
    visit inhouse_loan_items_url
    assert_selector "h1", text: "Inhouse loan items"
  end

  test "should create inhouse loan item" do
    visit inhouse_loan_items_url
    click_on "New inhouse loan item"

    fill_in "Advance", with: @inhouse_loan_item.advance
    fill_in "Balance", with: @inhouse_loan_item.balance
    fill_in "Due date", with: @inhouse_loan_item.due_date
    fill_in "Inhouse loan", with: @inhouse_loan_item.inhouse_loan_id
    fill_in "Interest", with: @inhouse_loan_item.interest
    check "Is paid" if @inhouse_loan_item.is_paid
    fill_in "Monthly amort", with: @inhouse_loan_item.monthly_amort
    fill_in "Or", with: @inhouse_loan_item.or
    fill_in "Paid amount", with: @inhouse_loan_item.paid_amount
    fill_in "Payment date", with: @inhouse_loan_item.payment_date
    fill_in "Penalty", with: @inhouse_loan_item.penalty
    fill_in "Principal", with: @inhouse_loan_item.principal
    fill_in "Term", with: @inhouse_loan_item.term
    click_on "Create Inhouse loan item"

    assert_text "Inhouse loan item was successfully created"
    click_on "Back"
  end

  test "should update Inhouse loan item" do
    visit inhouse_loan_item_url(@inhouse_loan_item)
    click_on "Edit this inhouse loan item", match: :first

    fill_in "Advance", with: @inhouse_loan_item.advance
    fill_in "Balance", with: @inhouse_loan_item.balance
    fill_in "Due date", with: @inhouse_loan_item.due_date
    fill_in "Inhouse loan", with: @inhouse_loan_item.inhouse_loan_id
    fill_in "Interest", with: @inhouse_loan_item.interest
    check "Is paid" if @inhouse_loan_item.is_paid
    fill_in "Monthly amort", with: @inhouse_loan_item.monthly_amort
    fill_in "Or", with: @inhouse_loan_item.or
    fill_in "Paid amount", with: @inhouse_loan_item.paid_amount
    fill_in "Payment date", with: @inhouse_loan_item.payment_date
    fill_in "Penalty", with: @inhouse_loan_item.penalty
    fill_in "Principal", with: @inhouse_loan_item.principal
    fill_in "Term", with: @inhouse_loan_item.term
    click_on "Update Inhouse loan item"

    assert_text "Inhouse loan item was successfully updated"
    click_on "Back"
  end

  test "should destroy Inhouse loan item" do
    visit inhouse_loan_item_url(@inhouse_loan_item)
    click_on "Destroy this inhouse loan item", match: :first

    assert_text "Inhouse loan item was successfully destroyed"
  end
end
