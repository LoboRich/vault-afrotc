class AddEmailToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :spa_address, :string
  end
end
