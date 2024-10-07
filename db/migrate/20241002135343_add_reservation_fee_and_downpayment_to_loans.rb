class AddReservationFeeAndDownpaymentToLoans < ActiveRecord::Migration[7.1]
  def change
    add_column :loans, :reservation_fee, :float, default: 0.0
    add_column :loans, :downpayment_percentage, :float, default: 0.0
  end
end
