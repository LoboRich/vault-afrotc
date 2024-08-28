class CreateWaterBills < ActiveRecord::Migration[7.1]
  def change
    create_table :water_bills, id: :uuid do |t|
      t.references :client, null: false, foreign_key: true, type: :uuid
      t.references :loan, null: false, foreign_key: true, type: :uuid
      t.integer :previous, default: 0
      t.integer :current, default: 0
      t.float :consume, default: 0
      t.float :amount, default: 0.0
      t.string :or_number
      t.datetime :due_date
      t.datetime :reading_date
      t.datetime :grace_period
      t.string :status, default: "unpaid"
      t.text :remarks
      t.float :penalty, default: 0.0
      t.float :total, default: 0.0
      t.string :mode_of_payment
      t.string :receipt
      t.string :reference_number

      t.timestamps
    end
  end
end
