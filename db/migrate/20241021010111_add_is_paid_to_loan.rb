class AddIsPaidToLoan < ActiveRecord::Migration[7.1]
  def change
    add_column :loans, :is_paid, :boolean
  end
end
