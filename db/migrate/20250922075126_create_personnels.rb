class CreatePersonnels < ActiveRecord::Migration[7.1]
  def change
    create_table :personnels, id: :uuid do |t|
      t.string :given_name
      t.string :last_name
      t.string :role
      t.string :contact_number
      t.uuid :user_id
      t.string :branch_location
      t.boolean :is_enabled
      
      t.timestamps
    end
  end
end
