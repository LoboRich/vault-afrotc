class AddFieldsToPaymentHistories < ActiveRecord::Migration[7.1]
  def change
    add_reference :payment_histories, :loan_item, null: false, foreign_key: true, type: :uuid
    add_column :payment_histories, :advance_payment, :float, default: 0.0
  end
end
