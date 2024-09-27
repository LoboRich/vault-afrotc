class ChangeDatatypeOfFilesColumnsInClients < ActiveRecord::Migration[7.1]
  def up
    change_column :clients, :birth_cert_img, :string, array: true, default: [], using: 'string_to_array(birth_cert_img, \',\')'
    change_column :clients, :valid_id_img, :string, array: true, default: [], using: 'string_to_array(valid_id_img, \',\')'
    change_column :clients, :proof_of_income_img, :string, array: true, default: [], using: 'string_to_array(proof_of_income_img, \',\')'
    change_column :clients, :marriage_contract_img, :string, array: true, default: [], using: 'string_to_array(marriage_contract_img, \',\')'
    change_column :clients, :spa_img, :string, array: true, default: [], using: 'string_to_array(spa_img, \',\')'
    change_column :clients, :pdc_img, :string, array: true, default: [], using: 'string_to_array(pdc_img, \',\')'
  end

  def down
    change_column :clients, :birth_cert_img, :string
    change_column :clients, :valid_id_img, :string
    change_column :clients, :proof_of_income_img, :string
    change_column :clients, :marriage_contract_img, :string
    change_column :clients, :spa_img, :string
    change_column :clients, :pdc_img, :string
  end
end
