class CreateInhouseLoans < ActiveRecord::Migration[7.1]
  def change
    create_table :inhouse_loans, id: :uuid do |t|
      t.references :client, null: false, foreign_key: true, type: :uuid
      t.references :loan, null: false, foreign_key: true, type: :uuid
      t.integer :terms
      t.string :loan_financing
      t.float :balance
      t.float :processing_fees
      t.float :downpayment
      t.float :interest
      t.float :principal
      t.float :monthly_amort
      t.datetime :contract_date
      t.datetime :amortization_start_date
      t.text :remarks
      t.float :other_expense

      t.timestamps
    end
  end
end
