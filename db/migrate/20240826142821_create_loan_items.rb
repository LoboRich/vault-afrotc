class CreateLoanItems < ActiveRecord::Migration[7.1]
  def change
    create_table :loan_items, id: :uuid do |t|
      t.integer :term
      t.references :loan, null: false, foreign_key: true, type: :uuid
      t.date :duedate
      t.float :principal
      t.float :interest
      t.float :monthly_amort
      t.float :balance
      t.boolean :is_paid

      t.timestamps
    end
  end
end
