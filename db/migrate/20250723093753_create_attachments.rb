class CreateAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :attachments, id: :uuid do |t|
      t.uuid :vehicle_id
      t.uuid :franchise_id
      t.string :image
      t.string :filename

      t.timestamps
    end
  end
end
