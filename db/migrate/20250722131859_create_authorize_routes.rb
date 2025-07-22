class CreateAuthorizeRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :authorize_routes, id: :uuid do |t|
      t.string :name
      t.string :route_type

      t.timestamps
    end
  end
end
