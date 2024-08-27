class CreatePaymentHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_histories, id: :uuid do |t|
      t.references :loan, null: false, foreign_key: true, type: :uuid
      t.float :current_balance
      t.float :interest, default: 0.0
      t.float :payment, default: 0.0
      t.float :new_balance, default: 0.0
      t.string :mode_of_payment
      t.string :check_bank
      t.string :check_no
      t.string :bank_name
      t.string :bank_account_no
      t.string :ar_account_no
      t.float :penalty, default: 0.0
      t.float :processing, default: 0.0
      t.float :reservation, default: 0.0
      t.float :equity, default: 0.0
      t.text :others
      t.float :advance_payment_to_principal, default: 0.0
      t.float :principal
      t.float :downpayment
      t.float :processing_fee, default: 0.0
      t.datetime :payment_date
      t.string :or_num
      t.string :memo
      t.string :running_balance
      t.boolean :is_deposited, default: false
      t.datetime :deposited_date
      t.string :deposited_memo
      t.string :deposited_bank_account
      t.string :receipt

      t.timestamps
    end
  end
end