class AddReceiptImgToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :water_bills, :receipt_img, :string
    add_column :loan_items, :receipt_img, :string
    add_column :inhouse_loan_items, :receipt_img, :string
  end
end
