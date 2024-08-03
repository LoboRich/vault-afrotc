class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :name
      t.string :mobile_number
      t.string :telephone_number
      t.string :email_address
      t.string :facebook_account_name
      t.text :address
      t.string :gender
      t.string :civil_status
      t.string :tin_number
      t.string :id_type
      t.string :id_number
      t.string :occupation
      t.string :years_employed
      t.string :employer_name
      t.string :employer_business_address
      t.string :spouse_name
      t.string :spouse_email
      t.string :spouse_contact_number
      t.text :spouse_address
      t.string :spouse_id_type
      t.string :spouse_id_number
      t.string :spouse_tin_number
      t.string :basic_salary
      t.string :annual_income
      t.string :status
      t.text :remarks
      t.json :documents

      t.timestamps
    end
  end
end
