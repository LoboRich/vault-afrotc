class AddBankNameToWaterBills < ActiveRecord::Migration[7.1]
  def change
    add_column :water_bills, :bank_name, :string
    add_column :water_bills, :payment_date, :datetime
    add_column :water_bills, :received_by, :string
  end
end
