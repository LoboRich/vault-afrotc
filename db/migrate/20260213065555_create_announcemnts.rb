class CreateAnnouncemnts < ActiveRecord::Migration[7.1]
  def change
    create_table :announcemnts, id: :uuid do |t|
      t.string :name
      t.text :description
      t.text :location
      t.float :latitude
      t.float :longitude
      t.string :atype

      t.timestamps
    end
  end
end
