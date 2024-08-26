class CreateLoanParcels < ActiveRecord::Migration[7.1]
  def change
    create_table :loan_parcels, id: :uuid do |t|
      t.references :loan, null: false, foreign_key: true, type: :uuid
      t.references :parcel, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
