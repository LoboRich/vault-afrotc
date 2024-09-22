class CreateHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :histories, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.text :description

      t.timestamps
    end
  end
end
