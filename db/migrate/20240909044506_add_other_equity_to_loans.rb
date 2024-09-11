class AddOtherEquityToLoans < ActiveRecord::Migration[7.1]
  def change
    add_column :loans, :other_expense, :decimal
  end
end
