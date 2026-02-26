class CreateAdts < ActiveRecord::Migration[7.1]
  def change
    create_table :adts, id: :uuid do |t|
      t.references :reservist, null: false, foreign_key: true, type: :uuid
      t.string :subject
      t.date :date_of_enlistment
      t.string :special_order_no
      t.date :special_order_no_date
      t.string :designation
      t.string :squadron

      t.timestamps
    end
  end
end
