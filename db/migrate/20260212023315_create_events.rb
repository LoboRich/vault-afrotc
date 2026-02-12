class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events, id: :uuid do |t|
      t.string :name
      t.text :description
      t.datetime :event_date
      t.text :location
      t.string :event_type

      t.timestamps
    end
  end
end
