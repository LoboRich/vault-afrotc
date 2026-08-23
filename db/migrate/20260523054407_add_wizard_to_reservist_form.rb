class AddWizardToReservistForm < ActiveRecord::Migration[7.1]
  def change
    add_column :reservists, :wizard_step, :integer, default: 1
    add_column :reservists, :draft, :boolean, default: true
  end
end
