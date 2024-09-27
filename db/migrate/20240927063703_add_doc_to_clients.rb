class AddDocToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :doc, :string
  end
end
