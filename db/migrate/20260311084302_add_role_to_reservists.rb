class AddRoleToReservists < ActiveRecord::Migration[7.1]
  def change
    add_column :reservists, :role, :integer, default: 0, null: false
  end
end
