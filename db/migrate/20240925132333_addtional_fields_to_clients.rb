class AddtionalFieldsToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :birth_cert_img, :string
    add_column :clients, :valid_id_img, :string
    add_column :clients, :proof_of_income_img, :string
    add_column :clients, :marriage_contract_img, :string
    add_column :clients, :spa_img, :string
    add_column :clients, :pdc_img, :string
  end
end
