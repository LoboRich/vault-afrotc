class CreateSubdivisions < ActiveRecord::Migration[7.1]
  def change
    create_table :subdivisions, id: :uuid do |t|
      t.string :name
      t.string :short_code
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
