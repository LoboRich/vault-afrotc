class CreateFranchises < ActiveRecord::Migration[7.1]
  def change
    create_table :franchises, id: :uuid do |t|
      t.string :case_num
      t.string :operator
      t.integer :auth_num_of_units
      t.date :date_granted
      t.date :expiry_date
      t.text :business_address
      t.uuid :authorize_route
      t.string :denomination
      t.string :year_confirmed
      t.string :status
      t.text :remarks
      t.integer :num_of_cpc
      t.date :cpc_validity

      t.timestamps
    end
  end
end
