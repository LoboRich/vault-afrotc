class CreateInhouseLoanItems < ActiveRecord::Migration[7.1]
  def change
    create_table :inhouse_loan_items, id: :uuid do |t|
      t.integer :term
      t.references :inhouse_loan, null: false, foreign_key: true, type: :uuid
      t.date :due_date
      t.float :principal
      t.float :interest
      t.float :monthly_amort
      t.float :balance
      t.boolean :is_paid
      t.float :penalty
      t.float :advance
      t.datetime :payment_date
      t.string :or
      t.float :paid_amount

      t.timestamps
    end
  end
end
