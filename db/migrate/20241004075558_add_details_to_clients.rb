class AddDetailsToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :spa_name, :string
    add_column :clients, :spa_id_type, :integer
    add_column :clients, :spa_id_number, :integer

    add_column :clients, :spa_relationship_to_buyer, :string
    add_column :clients, :spa_email, :string
    add_column :clients, :spa_mobile_number, :string
    add_column :clients, :spa_facebook_name, :string
  end
end
