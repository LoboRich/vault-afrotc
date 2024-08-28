class AddFieldsToLoanItem < ActiveRecord::Migration[7.1]
  def change
    add_column :loan_items, :penalty, :float, default: 0.0
    add_column :loan_items, :advance, :float, default: 0.0
    add_column :loan_items, :payment_date, :datetime
    add_column :loan_items, :or, :string
    add_column :loan_items, :paid_amount, :float, default: 0.0
  end
end
