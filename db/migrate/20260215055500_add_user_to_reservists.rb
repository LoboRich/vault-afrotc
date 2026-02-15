class AddUserToReservists < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservists, :user, foreign_key: true, type: :uuid
  end
end
