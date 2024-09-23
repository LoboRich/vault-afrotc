class CreatePurchasers < ActiveRecord::Migration[7.1]
  def change
    create_table :purchasers, id: :uuid do |t|
      t.string :name
      t.float :budget
      t.float :expense
      t.datetime :date_started
      t.datetime :deadline
      t.string :status
      t.text :remarks
      t.references :parcel, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
