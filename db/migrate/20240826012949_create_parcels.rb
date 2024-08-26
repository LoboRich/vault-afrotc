class CreateParcels < ActiveRecord::Migration[7.1]
  def change
    create_table :parcels, id: :uuid do |t|
      t.string :block
      t.string :lot
      t.string :status

      t.timestamps
    end
  end
end
