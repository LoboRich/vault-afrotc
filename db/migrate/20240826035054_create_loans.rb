class CreateLoans < ActiveRecord::Migration[7.1]
  def change
    create_table :loans, id: :uuid do |t|
      t.references :client, null: false, foreign_key: true, type: :uuid
      t.string :blocklot
      t.integer :terms
      t.string :model_house
      t.string :loan_financing
      t.float :contract_price
      t.float :processing_fees
      t.float :downpayment
      t.float :interest
      t.float :principal
      t.float :monthly_amort
      t.date :contract_date
      t.date :amortization_start_date
      t.float :balance
      t.text :remarks
      t.string :status
      t.string :broker

      t.timestamps
    end
  end
end
